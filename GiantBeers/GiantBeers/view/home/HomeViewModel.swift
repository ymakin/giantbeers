//
//  HomeViewModel.swift
//  GiantBeers
//
//  Created by Yasin Makin on 20.12.23.
//

import Foundation

class HomeViewModel: ObservableObject {
    let beerUseCase: BeerUseCase
    @Published var beers: [Beer] = [Beer]()
    @Published var error: NetworkErrorType? = nil
    @Published var searchText: String = ""
    
    var searchedBeer: [Beer] {
        guard !searchText.isEmpty else {
            return beers
        }
        return beers.filter { $0.name.contains(searchText)}
    }
    
    init(beerUseCase: BeerUseCase = BeerUseCase()) {
        self.beerUseCase = beerUseCase
    }
    
    func loadBeers() {
        Task {
            let result = await beerUseCase.beersRequest(_with: RequestParameter())
            switch(result) {
            case .success(let loadedBeers):
                await MainActor.run {
                    beers = loadedBeers
                }
            case .error(let loadedError):
                await MainActor.run { error = loadedError }
            }
        }
    }
}
