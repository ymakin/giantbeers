//
//  HomeView.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            BeerListView(name: "Beer 1", tagline: "A Real Bitter Experience.")
            BeerListView(name: "Beer 2", tagline: "A Real Bitter Experience.")
            BeerListView(name: "Beer 3", tagline: "A Real Bitter Experience.")
            BeerListView(name: "Beer 4", tagline: "A Real Bitter Experience.")
            BeerListView(name: "Beer 5", tagline: "A Real Bitter Experience.")
            BeerListView(name: "Beer 6", tagline: "A Real Bitter Experience.")
        }
    }
}

#Preview {
    HomeView()
}
