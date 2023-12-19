//
//  Method.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import Foundation

struct Method: Decodable, Hashable {
    struct MashTempItem: Decodable, Hashable {
        let temp: Quantity
        let duration: Int?
    }
    
    struct Fermentation: Decodable, Hashable {
        let temp: Quantity
    }
    
    let mashTemp: [MashTempItem]
    let fermentation: Fermentation
    let twist: String? = nil
    
    private enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation
    }
}
