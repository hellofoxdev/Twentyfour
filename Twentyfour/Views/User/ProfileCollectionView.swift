//
//  UserCollectionView.swift
//  Twentyfour
//
//  Created by Sebastian Fox on 27.09.22.
//

import SwiftUI
import WaterfallGrid
import CachedAsyncImage

struct ProfileCollectionView: View {
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @State private var isMenuOpened: Bool = false
    @State private var columns: Int = 3
    
    @State private var selectedProfileId: String = ""
    @State private var selectedProfileImageUrl: String = ""
    @State private var selectedProfile: PublicProfile = PublicProfile.empty
    
    private var gridItemLayout = [
        GridItem(.flexible(), spacing: 15),
//        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)]
    
    var body: some View {
        ZStack() {
            ScrollView(showsIndicators: false) {
                VStack(){
                    
                    
//                    LazyVGrid(columns: gridItemLayout) {
//                                     ForEach(profileViewModel.publicProfiles, id: \.self) { publicProfile in
//                                         AsyncImage(url: URL(string: publicProfile.imageUrl)) { image in
//                                             image.resizable()
//                                                 .aspectRatio(contentMode: .fill)
//                                                 .frame(width: 120, height: 120)
//                                                 .clipShape(Circle())
//                                         }
//                                     placeholder: {
//                                         ProgressView()
//                                     }
//                                     }
//                                 }
                    
                    StaggeredGrid(columns: columns, list: profileViewModel.publicProfiles, content: { publicProfile in

                        Button(action: {
                            withAnimation(.linear(duration: 0.2)) {
                                selectedProfileId = publicProfile.id!
                                selectedProfileImageUrl = publicProfile.imageUrl
                                selectedProfile = publicProfile
                                isMenuOpened = true
                            }
                        }) {
                            ProfileGridCard(publicProfile: publicProfile, isMenuOpened: $isMenuOpened)
                        }
                    })
                   .offset(y: -70)
                    
                    Rectangle().fill(Color.clear).frame(height: 100)
                    
                    //                    WaterfallGrid((0..<profileViewModel.publicProfiles.count), id: \.self) { index in
                    //
                    //                        Button(action: {
                    //                            withAnimation(.linear(duration: 0.2)) {
                    //                                selectedProfileId = profileViewModel.publicProfiles[index].id!
                    //                                selectedProfileImageUrl = profileViewModel.publicProfiles[index].imageUrl
                    //                                selectedProfile = profileViewModel.publicProfiles[index]
                    //                                isMenuOpened = true
                    //                            }
                    //                        }) {
                    //                            AsyncImage(url: URL(string: profileViewModel.publicProfiles[index].imageUrl)) { image in
                    //                                image
                    //                                    .resizable()
                    //                                    .frame(maxHeight: .infinity)
                    //                                    .aspectRatio(contentMode: .fill)
                    //                            }
                    //                        placeholder: {
                    //                            Rectangle()
                    //                                //.frame(width: 200, height: 100)
                    //                           // ProgressView()
                    //                        }
                    //                        .frame(maxHeight: .infinity)
                    ////                            ProfileGridCard(publicProfile: profileViewModel.publicProfiles[index])
                    //                      //          .frame(maxWidth: .infinity)
                    //                        }
                    //                    }
                    //                    .gridStyle(columns: 3)
                }
            }
            .background(Color.black)
            VStack() {
                Spacer()
                Rectangle().fill(dynamicColorGradient(colors: [.clear, .black])).frame(height: 100).offset(y: 10)
                Rectangle().fill(Color.black).frame(height: isMenuOpened ? selectedProfileId != "" ? 490 : 390 : 100)
            }
            .edgesIgnoringSafeArea(.all)
            VStack(){
                Spacer()
                if isMenuOpened {
                    if selectedProfileId == "" {
                        ProfileSearchMenuView(columns: $columns)
                    } else {
                        VStack() {
                            CachedAsyncImage(url: URL(string: selectedProfileImageUrl)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaledToFill()
                                    .frame(width: 160, height: 160)
                                    .clipShape(Circle())
                            } placeholder: {
                                Image(systemName: "photo")
                                    .imageScale(.large)
                                    .frame(width: 110, height: 110)
                            }
                            
                            
                            
                            Text(selectedProfile.name)
                                .font(.system(size: 30, weight: .heavy))
                                .foregroundColor(.white)
                                .lineLimit(1)
                                .padding(.bottom, 20)
                            
                            VStack() {
                                Button(action: {
                                    withAnimation(.linear(duration: 0.2)) {
                                    }
                                }) {
                                    Text("Nachricht schreiben")
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Capsule())
                                }
                                
                                Button(action: {
                                    withAnimation(.linear(duration: 0.2)) {
                                    }
                                }) {
                                    Text("Profile ansehen")
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Capsule())
                                }
                            }
                        }
                    }
                }
                Button(action: {
                    withAnimation(.linear(duration: 0.2)) {
                        self.isMenuOpened.toggle()
                        selectedProfile = PublicProfile.empty
                        selectedProfileId = ""
                        selectedProfileImageUrl = ""
                    }
                }) {
                    Text(isMenuOpened ? "close" : "Los Angeles")
                        .fontWeight(.bold)
                        .foregroundColor(isMenuOpened ? .white : .black)
                        .padding()
                        .background(isMenuOpened ? Color("darkGray") : Color.white)
                        .clipShape(Capsule())
                }
                .padding()
            }
        }
        .onAppear(){
            profileViewModel.fetchAllPublicProfiles({ (success, message) -> Void in
                if success {
                    print(message)
                } else {
                    print(message)
                }
            })
        }
    }
}
