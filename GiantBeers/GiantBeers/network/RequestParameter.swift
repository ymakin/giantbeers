//
//  RequestParameter.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import Foundation

class RequestParameter {
    var abvGreaterThen: Float?
    var abvLessThen: Float?
    var ibuGreaterThen: Float?
    var ibuLessThen : Float?
    var ebcGreaterThen: Float?
    var ebcLessThen: Float?
    var beerName: String?
    var yeast: String?
    var brewedBefore: Date?
    var brewedAfter: Date?
    var hops: String?
    var malt: String?
    var food: String?
    var ids: String?
    
    init(abvGreaterThen: Float? = nil,
         abvLessThen: Float? = nil,
         ibuGreaterThen: Float? = nil,
         ibuLessThen: Float? = nil,
         ebcGreaterThen: Float? = nil,
         ebcLessThen: Float? = nil,
         beerName: String? = nil,
         yeast: String? = nil,
         brewedBefore: Date? = nil,
         brewedAfter: Date? = nil,
         hops: String? = nil,
         malt: String? = nil,
         food: String? = nil,
         ids: String? = nil
    ) {
        self.abvGreaterThen = abvGreaterThen
        self.abvLessThen = abvLessThen
        self.ibuGreaterThen = ibuGreaterThen
        self.ibuLessThen = ibuLessThen
        self.ebcGreaterThen = ebcGreaterThen
        self.ebcLessThen = ebcLessThen
        self.beerName = beerName
        self.yeast = yeast
        self.brewedBefore = brewedBefore
        self.brewedAfter = brewedAfter
        self.hops = hops
        self.malt = malt
        self.food = food
        self.ids = ids
    }
    
    func addParams(with url: URL) -> URL? {
        let urlQueryItems = [
            abvGreaterThen.urlQueryItem(name: "abv_gt"),
            abvLessThen.urlQueryItem(name: "abv_lt"),
            ibuGreaterThen.urlQueryItem(name: "ibu_gt"),
            ibuLessThen.urlQueryItem(name: "ibu_lt"),
            ebcGreaterThen.urlQueryItem(name: "ebc_gt"),
            ebcLessThen.urlQueryItem(name: "ebc_lt"),
            beerName.urlQueryItem(name: "beer_name"),
            yeast.urlQueryItem(name: "yeast"),
            brewedBefore.urlQueryItem(name: "brewed_before"),
            brewedAfter.urlQueryItem(name: "brewed_after"),
            hops.urlQueryItem(name: "hops"),
            malt.urlQueryItem(name: "malt"),
            food.urlQueryItem(name: "food"),
            ids.urlQueryItem(name: "ids")
        ].compactMap { $0 }
        
        guard var urlComponents = URLComponents(string: url.absoluteString) else {
            return nil
        }
        
        urlComponents.queryItems = urlQueryItems
        return urlComponents.url
    }
    
    func setIds(ids: [Int]) {
        guard !ids.isEmpty else { return }
        var combinedIds = ""
        for (index, id) in ids.enumerated() {
            combinedIds += String(id)
            if index != ids.count - 1 {
                combinedIds += "|"
            }
        }
        self.ids = combinedIds
    }
}
