//
//  Beer+Mock.swift
//  GiantBeers
//
//  Created by Yasin Makin on 21.12.23.
//

import Foundation

extension Beer {
    static var mock1: Beer {
        Beer(
            id: 1,
            name: "Buzz",
            tagline: "A Real Bitter Experience.",
            firstBrewed: "09/2007",
            description: "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.",
            imageUrl: URL(string: "https://images.punkapi.com/v2/keg.png")!,
            abv: 4.5,
            ibu: 60,
            target_fg: 1010,
            target_og: 1044,
            ebc: 20,
            srm: 10,
            ph: 4.4,
            attenuation_level: 4.0,
            volume: Quantity(value: 1.0, unit: "lites"),
            boilVolume: Quantity(value: 1.0, unit: "litres"),
            method: Method(
                mashTemp: [Method.MashTempItem](),
                fermentation: Method.Fermentation(
                    temp: Quantity(value: 1.0, unit: "litres")
                )
            ),
            ingredients: Ingredients(
                malt: [Ingredients.MaltItem](),
                hops: [Ingredients.HopsItem](),
                yeast: ""
            ),
            foodPairing: [""],
            brewersTips: "",
            contributedBy: ""
        )
    }
    
    static var mock2: Beer {
        Beer(
            id: 1,
            name: "Test",
            tagline: "A Real Bitter Experience.",
            firstBrewed: "09/2007",
            description: "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.",
            imageUrl: URL(string: "https://images.punkapi.com/v2/keg.png")!,
            abv: 4.5,
            ibu: 60,
            target_fg: 1010,
            target_og: 1044,
            ebc: 20,
            srm: 10,
            ph: 4.4,
            attenuation_level: 4.0,
            volume: Quantity(value: 1.0, unit: "lites"),
            boilVolume: Quantity(value: 1.0, unit: "litres"),
            method: Method(
                mashTemp: [Method.MashTempItem](),
                fermentation: Method.Fermentation(
                    temp: Quantity(value: 1.0, unit: "litres")
                )
            ),
            ingredients: Ingredients(
                malt: [Ingredients.MaltItem](),
                hops: [Ingredients.HopsItem](),
                yeast: ""
            ),
            foodPairing: [""],
            brewersTips: "",
            contributedBy: ""
        )
    }
}
