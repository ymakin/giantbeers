//
//  HomeView.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import SwiftUI

struct HomeView: View {
    private enum Route: Hashable {
        case detail(_ beer: Beer)
        case filter
    }
    
    @ObservedObject var viewModel: HomeViewModel
    @State private(set) var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(viewModel.searchedBeer) { beer in
                    BeerItemView(name: beer.name, tagline: beer.tagline, url: beer.imageUrl)
                        .onTapGesture {
                            path.append(Route.detail(beer))
                        }
                }
            }
            .refreshable {
                viewModel.loadBeers()
            }
            .task {
                viewModel.loadBeers()
            }
            .navigationTitle("GiantBeer")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .detail(let beer):
                    BeerDetailView(beer: beer)
                case .filter:
                    Text("")
                }
            }
            .searchable(text: $viewModel.searchText)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
