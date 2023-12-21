//
//  BeerUseCase.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import Foundation

struct BeerUseCase {
    let network: NetworkProtocol
    private let version = "V2"
    private let themePath = "beers"
    
    var url: URL {
        let baseUrl = URL(string: NetworkEnvironment.develop)!
        let urlWithVersion = baseUrl.appendingPathComponent(version)
        let urlWithThemePath = urlWithVersion.appendingPathComponent(themePath)
        return urlWithThemePath
    }
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
    
    func beersRequest(with requestParameter: RequestParameter) async -> ResultType<[Beer]> {
        let urlWithParameter = requestParameter.addParams(with: url)!
        let result: ResultType<[Beer]> = await network.request(url: urlWithParameter)
        return result
    }
}
