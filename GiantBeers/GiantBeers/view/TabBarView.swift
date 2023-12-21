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
            HomeView(viewModel: HomeViewModel())
                .tabItem {
                    Label("Home", systemImage: "waterbottle")
                }
                
            FavouriteView(viewModel: FavouriteViewModel())
                .tabItem {
                    Label("Favoriten", systemImage: "heart")
                }
        }
    }
}

#Preview {
    TabBarView()
}
