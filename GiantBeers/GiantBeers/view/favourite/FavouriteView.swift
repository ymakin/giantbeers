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
            switch viewModel.state {
            case .loading:
                ProgressView()
                    .frame(width: 50, height: 50)
            case .success:
                listView
            case .error:
                errorView
            }
        }
        .task {
            loadBeers()
        }
    }
    
    @ViewBuilder
    var listView: some View {
        if viewModel.searchedBeer.isEmpty {
            VStack {
                Text("Du hast noch keine Favoriten gesetzt.")
                    .padding(50)
            }
        } else {
            List {
                ForEach(viewModel.searchedBeer) { beer in
                    BeerItemView(beer: beer)
                        .onTapGesture {
                            path.append(Route.detail(beer))
                        }
                }
            }
            .refreshable {
                loadBeers()
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
    
    @ViewBuilder
    private var errorView: some View {
        Text("Es ist ein Fehler passiert und die App konnte keine Biersorten laden.")
            .padding(50)
        Button {
            loadBeers()
        } label: {
            Text("Erneut versuchen")
                .padding(10)
        }
        .background(AppColor.primaryColor)
        .foregroundColor(Color.white)
        .cornerRadius(10)
    }
    
    private func loadBeers() {
        Task {
            await viewModel.loadBeers()
        }
    }
}

#Preview {
    FavouriteView(viewModel: FavouriteViewModel())
}
