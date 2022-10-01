//
//  UserSearchMenuView.swift
//  Twentyfour
//
//  Created by Sebastian Fox on 28.09.22.
//

import SwiftUI

struct ProfileSearchMenuView: View {
    @Binding var columns: Int
    
    func toggleColumsAmount() {
        if columns == 3 {
            columns = 4
        } else {
            columns = 3
        }
    }
    var body: some View {
        VStack() {
            Text("Los Angeles")
                .font(.system(size: 30, weight: .heavy))
                .foregroundColor(.white)
                .offset(y: 8)
            HStack() {
                Text("+5km")
                // .font(.system(size: 30, weight: .bold))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("darkGray"))
                    .clipShape(Capsule())
            }
            .padding(.bottom, 20)
            
            Button(action:  {
                withAnimation(.linear(duration: 0.2)) {
                    toggleColumsAmount()
                }
            }) {
                Text("Ich habe hunger")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .clipShape(Capsule())
            }
            Button(action: {
                withAnimation(.linear(duration: 0.2)) {
//                    if rows == 2 {
//                        rows = 3
//                    } else {
//                        rows = 2
//                    }
                }
            }) {
                Text("Ich möchte etwas unternehmen")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .clipShape(Capsule())
            }
        }
    }
}
