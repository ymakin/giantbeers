//
//  Beer.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import Foundation

struct Beer: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let tagline: String
    let firstBrewed: String
    let description: String
    let imageUrl: URL
    let abv: Float
    let ibu: Float?
    let target_fg: Float
    let target_og: Float
    let ebc: Int?
    let srm: Float?
    let ph: Float?
    let attenuation_level: Float
    let volume: Quantity
    let boilVolume: Quantity
    let method: Method
    let ingredients: Ingredients
    let foodPairing: [String]
    let brewersTips: String
    let contributedBy: String
    
    init(
        id: Int,
        name: String,
        tagline: String,
        firstBrewed: String,
        description: String,
        imageUrl: URL, 
        abv: Float,
        ibu: Float? = nil,
        target_fg: Float,
        target_og: Float,
        ebc: Int? = nil,
        srm: Float? = nil,
        ph: Float? = nil,
        attenuation_level: Float,
        volume: Quantity,
        boilVolume: Quantity,
        method: Method,
        ingredients: Ingredients,
        foodPairing: [String],
        brewersTips: String,
        contributedBy: String
    ) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.firstBrewed = firstBrewed
        self.description = description
        self.imageUrl = imageUrl
        self.abv = abv
        self.ibu = ibu
        self.target_fg = target_fg
        self.target_og = target_og
        self.ebc = ebc
        self.srm = srm
        self.ph = ph
        self.attenuation_level = attenuation_level
        self.volume = volume
        self.boilVolume = boilVolume
        self.method = method
        self.ingredients = ingredients
        self.foodPairing = foodPairing
        self.brewersTips = brewersTips
        self.contributedBy = contributedBy
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case firstBrewed = "first_brewed"
        case description
        case imageUrl = "image_url"
        case abv
        case ibu
        case target_fg
        case target_og
        case ebc
        case srm
        case ph
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
