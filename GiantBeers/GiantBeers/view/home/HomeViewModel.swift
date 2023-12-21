//
//  HomeViewModel.swift
//  GiantBeers
//
//  Created by Yasin Makin on 20.12.23.
//

import Foundation

class HomeViewModel: ObservableObject {
    let beerUseCase: BeerUseCaseProtocol
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
    
    init(beerUseCase: BeerUseCaseProtocol = BeerUseCase()) {
        self.beerUseCase = beerUseCase
    }
    
    func loadBeers() async {
        let result = await beerUseCase.beersRequest(with: RequestParameter())
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
