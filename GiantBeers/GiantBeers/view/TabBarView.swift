//
//  TabBarView.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "waterbottle")
                }
            
            HomeView()
                .tabItem {
                    Label("Favoriten", systemImage: "heart")
                }
            
            HomeView()
                .tabItem {
                    Label("Einstellungen", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    TabBarView()
}
