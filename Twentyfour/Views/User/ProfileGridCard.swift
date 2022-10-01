//
//  UserGridCard.swift
//  Twentyfour
//
//  Created by Sebastian Fox on 28.09.22.
//

import SwiftUI
import Foundation
import CachedAsyncImage

struct ProfileGridCard: View {
    var publicProfile: PublicProfile!
    
    @Binding var isMenuOpened: Bool
    
    
    @State private var rect1 = CGRect()
    
    var body: some View {
        VStack() {
            AsyncImage(url: URL(string: publicProfile.imageUrl)) { image in
                image.resizable()
            }
        placeholder: {
            ProgressView()
        }
        .overlay(
            ZStack(){
                dynamicColorGradient(colors: [.clear, .black.opacity(0.4)])
                VStack() {
                    Spacer()
                    HStack() {
                       // Spacer()
                        Text(publicProfile.name)
                            .font(.system(size: 16))
                            .foregroundColor(.white.opacity(isMenuOpened ? 0.3 : 0.8))
                            .fontWeight(.bold)
                            .lineLimit(1)
                            .padding(.horizontal, 10)
                            .padding(.bottom, 5)
                        Spacer()
                        
                    }
                }
            }
        )
        .aspectRatio(contentMode: .fit)
        .cornerRadius(15)
        }.opacity(isMenuOpened ? 0.6 : 1)
            .saturation(0.9)
    }
}
