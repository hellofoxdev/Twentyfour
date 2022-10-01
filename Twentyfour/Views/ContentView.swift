//
//  ContentView.swift
//  Twentyfour
//
//  Created by Sebastian Fox on 27.09.22.
//

import SwiftUI
import WaterfallGrid

struct ContentView: View {
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @State private var isMenuOpened: Bool = false
    @State private var rows: Int = 3
    
    var body: some View {
        ProfileCollectionView()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
