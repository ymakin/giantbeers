//
//  HomeViewModelTests.swift
//  HomeViewModelTests
//
//  Created by Yasin Makin on 19.12.23.
//

import XCTest
@testable import GiantBeers

final class HomeViewModelTests: XCTestCase {
    private var sut: HomeViewModel!
    
    override func setUpWithError() throws {
        sut = HomeViewModel(beerUseCase: MockBeerUseCase())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testState_defaultValue_shouldBeLoading() {
        // then
        XCTAssertEqual(sut.state, .loading)
    }

    func testLoadBeers_whenResponseIsAnError_shouldHaveCorrectly() async throws {
        // When
        let mock = MockBeerUseCase()
        let mockType = NetworkErrorType.undefined
        mock.response = .error(type: mockType)
        sut = HomeViewModel(beerUseCase: mock)
        
        await sut.loadBeers()
        
        //then
        XCTAssertEqual(sut.beers, [])
        XCTAssertEqual(sut.state, .error)
        XCTAssertEqual(sut.error, mockType)
    }
    
    func testLoadBeers_whenResponseIsSuccessful_shouldHaveCorrectly() async throws {
        // When
        let mock = MockBeerUseCase()
        let mockData = [Beer.mock1, Beer.mock2]
        mock.response = .success(data: mockData)
        sut = HomeViewModel(beerUseCase: mock)
        
        await sut.loadBeers()
        
        //then
        XCTAssertEqual(sut.beers, mockData)
        XCTAssertEqual(sut.state, .success)
        XCTAssertEqual(sut.error, nil)
    }
    
    func testSearchedBeer_whenSearchIsSetCorrectly_searchedBeerContainsBeersCorrectly() async throws {
        // When
        let mockBeers = [Beer.mock1, Beer.mock2]
        sut.beers = mockBeers
        sut.searchText = "B"
        
        //then
        XCTAssertEqual(sut.searchedBeer.count, 1)
        XCTAssertEqual(sut.searchedBeer.first, Beer.mock1)
        XCTAssertEqual(sut.beers, mockBeers)
    }
    
    func testSearchedBeer_whenSearchIsSetNotCorrectly_searchedBeerContainsBeersCorrectly() throws {
        // When
        let mockBeers = [Beer.mock1, Beer.mock2]
        sut.beers = mockBeers
        sut.searchText = "X"
        
        //then
        XCTAssertEqual(sut.searchedBeer.count, 0)
        XCTAssertEqual(sut.beers, mockBeers)
    }
}
