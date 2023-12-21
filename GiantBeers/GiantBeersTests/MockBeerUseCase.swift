//
//  MockNetwork.swift
//  GiantBeersTests
//
//  Created by Yasin Makin on 21.12.23.
//

import XCTest
@testable import GiantBeers

class MockBeerUseCase: BeerUseCaseProtocol {
    var response: ResultType<[Beer]> = .success(data: [Beer]())
    
    func beersRequest(with requestParameter: GiantBeers.RequestParameter) async -> GiantBeers.ResultType<[GiantBeers.Beer]> {
        response
    }
}
