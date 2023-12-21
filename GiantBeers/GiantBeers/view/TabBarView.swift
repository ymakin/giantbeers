//
//  TabBarView.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import SwiftUI
import UIKit

struct TabBarView: View {
    var body: some View {
        TabView {
            Group {
                HomeView(viewModel: HomeViewModel())
                    .tabItem {
                        Label("Home", systemImage: "waterbottle")
                            .foregroundColor(.white)
                    }
                    
                
                FavouriteView()
                    .tabItem {
                        Label("Favoriten", systemImage: "heart")
                            .foregroundColor(.white)
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Einstellungen", systemImage: "gearshape")
                    }
            }
        }
    }
}

#Preview {
    TabBarView()
}
