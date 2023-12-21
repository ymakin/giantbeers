//
//  FavouriteView.swift
//  GiantBeers
//
//  Created by Yasin Makin on 20.12.23.
//

import SwiftUI

struct FavouriteView: View {
    private enum Route: Hashable {
        case detail(_ beer: Beer)
    }
    
    @ObservedObject var viewModel: FavouriteViewModel
    @State private(set) var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            if viewModel.searchedBeer.isEmpty {
                VStack {
                    Text("Du hast noch keine Favoriten gesetzt. Oder es ist ein Fehler passiert und die App konnte keine Biersorten laden.")
                        .padding(50)
                    Button {
                        viewModel.loadBeers()
                    } label: {
                        Text("Bitte erneut laden")
                            .padding(10)
                    }
                    .background(AppColor.primaryColor)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                }
                
            } else {
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
                .navigationTitle("Favoriten")
                .navigationBarTitleDisplayMode(.inline)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .detail(let beer):
                        BeerDetailView(beer: beer)
                    }
                }
                .searchable(text: $viewModel.searchText)
            }
        }
    }
}

#Preview {
    FavouriteView(viewModel: FavouriteViewModel())
}
