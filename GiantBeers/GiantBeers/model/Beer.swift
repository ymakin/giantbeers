//
//  Beer.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import Foundation

struct Beer: Decodable, Hashable {
    let id: Int
    let name: String
    let tagline: String
    let firstBrewed: String
    let description: String
    let imageUrl: URL
    let abv: Float
    let ibu: Float? = nil
    let target_fg: Int
    let target_og: Int
    let ebc: Int? = nil
    let srm: Int? = nil
    let ph: Float? = nil
    let attenuation_level: Int
    let volume: Quantity
    let boilVolume: Quantity
    let method: Method
    let ingredients: Ingredients
    let foodPairing: [String]
    let brewersTips: String
    let contributedBy: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case firstBrewed = "first_brewed"
        case description
        case imageUrl = "image_url"
        case abv
        case target_fg
        case target_og
        case attenuation_level
        case volume
        case boilVolume = "boil_volume"
        case method
        case ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
}
