//
//  Volume.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import Foundation

struct Quantity: Decodable, Hashable {
    enum UnitType: Decodable, Hashable {
        case litres
        case celsius
        case kilograms
    }
    
    let value: Float
    let unit: UnitType
}
