//
//  BeerUseCase.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import Foundation

struct BeerUseCase {
    let network: NetworkProtocol
    
    var version: String {
        "V2"
    }
    
    var themePath: String {
        "beers"
    }
    
    var url: URL {
        let baseUrl = URL(string: NetworkEnvironment.develop)!
        let urlWithVersion = baseUrl.appendingPathComponent(version)
        let urlWithThemePath = urlWithVersion.appendingPathComponent(themePath)
        return urlWithThemePath
    }
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
    
    func detailBeerRequest(_with id: String) -> ResultType<Beer> {
        let urlWithId = url.appendingPathComponent(id)
        
        Task {
            let result: ResultType<Beer> = await network.request(url: urlWithId)
            return result
        }
        
        return .error(type: .undefined)
    }
    
    func beersRequest(_with requestParameter: RequestParameter) async -> ResultType<[Beer]> {
        let urlWithParameter = requestParameter.addParams(_with: url)!
        let result: ResultType<[Beer]> = await network.request(url: urlWithParameter)
        return result
    }
}
