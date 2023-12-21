//
//  FavouriteViewModel.swift
//  GiantBeers
//
//  Created by Yasin Makin on 21.12.23.
//

import Foundation

class FavouriteViewModel: ObservableObject {
    let beerUseCase: BeerUseCase
    let favouriteManager: FavouriteManager
    
    @Published var beers: [Beer] = [Beer]()
    @Published var error: NetworkErrorType? = nil
    @Published var searchText: String = ""
    @Published var state: ViewState = .loading
    
    var searchedBeer: [Beer] {
        guard !searchText.isEmpty else {
            return beers
        }
        return beers.filter { $0.name.contains(searchText)}
    }
    
    init(beerUseCase: BeerUseCase = BeerUseCase(), favouriteManager: FavouriteManager = FavouriteManager()) {
        self.beerUseCase = beerUseCase
        self.favouriteManager = favouriteManager
    }
    
    func loadBeers() async {
        let loadedFavouriteIds = favouriteManager.load()
        guard !loadedFavouriteIds.isEmpty else { return }
        
        let requestParameter = RequestParameter()
        requestParameter.setIds(ids: loadedFavouriteIds)
        
        let result = await beerUseCase.beersRequest(with: requestParameter)
        switch(result) {
        case .success(let loadedBeers):
            await MainActor.run {
                beers = loadedBeers
                state = .success
            }
        case .error(let loadedError):
            await MainActor.run {
                error = loadedError
                state = .error
            }
        }
    }
}



