//
//  Ingredients.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import Foundation

struct Ingredients: Decodable, Hashable {
    struct MaltItem: Decodable, Hashable {
        let name: String
        let amount: Quantity
    }
    
    struct HopsItem: Decodable, Hashable {
        let name: String
        let amount: Quantity
        let add: String
        let attribute: String
    }
    
    let malt: [MaltItem]
    let hops: [HopsItem]
    let yeast: String
}
