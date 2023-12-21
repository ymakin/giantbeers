//
//  DetailBeerView.swift
//  GiantBeers
//
//  Created by Yasin Makin on 20.12.23.
//

import SwiftUI

struct BeerDetailView: View {
    let beer: Beer
    
    init(beer: Beer) {
        self.beer = beer
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack (alignment: .leading, spacing: 20.0) {
                    AsyncImage(url: beer.imageUrl) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width, height: 300)

                    } placeholder: {
                        ProgressView()
                            .frame(width: 50, height: 50)
                    }

                    VStack(alignment: .leading, spacing: 20.0) {
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(beer.name + " - " + beer.tagline)
                                .font(Font.system(size: 18.0, weight: .bold))
                                .foregroundColor(AppColor.primaryColor)
                            
                            Text("Gebraut: " + beer.firstBrewed)
                            Text("Liter: " + String(beer.volume.value))
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Beschreibung:")
                                .font(Font.system(size: 18.0, weight: .bold))
                                .foregroundColor(AppColor.primaryColor)
                            Text(beer.description)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Werte:")
                                .font(Font.system(size: 18.0, weight: .bold))
                                .foregroundColor(AppColor.primaryColor)
                            allUnits()
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Zutaten:")
                                .font(Font.system(size: 18.0, weight: .bold))
                                .foregroundColor(AppColor.primaryColor)
                            allIngredients()
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Empfehlung Essen:")
                                .font(Font.system(size: 18.0, weight: .bold))
                                .foregroundColor(AppColor.primaryColor)
                            VStack(alignment: .leading) {
                                ForEach(beer.foodPairing, id: \.self) {
                                    Text("* " + $0)
                                        .font(.system(size: 14.0, weight: .bold))
                                }
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Tipps:")
                                .font(Font.system(size: 18.0, weight: .bold))
                                .foregroundColor(AppColor.primaryColor)
                            Text(beer.brewersTips)
                                .font(.system(size: 14.0))
                        }
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                    
                }
            }
            .navigationTitle(beer.name)
        }
    }
    
    func allUnits() -> Text {
        var allText: Text = Text("Alk. Gehalt: ").font(.system(size: 14, weight: .bold))
        + Text(String(beer.abv)).font(.system(size: 12))
        
        allText = allText + Text(", ")
        allText = allText + Text("Restextrakt: ").font(.system(size: 14, weight: .bold))
        allText = allText + Text(String(beer.target_fg)).font(.system(size: 12))
        
        allText = allText + Text(", ")
        allText = allText + Text("Stammwürze: ").font(.system(size: 14, weight: .bold))
        allText = allText + Text(String(beer.target_og)).font(.system(size: 12))
        
        if let ibu = beer.ibu {
            allText = allText + Text(", ")
            allText = allText + Text("Bitterkeit: ").font(.system(size: 14, weight: .bold))
            allText = allText + Text(String(ibu)).font(.system(size: 12))
        }
        
        if let ebc = beer.ebc {
            allText = allText + Text(", ")
            allText = allText + Text("Farbe: ").font(.system(size: 14, weight: .bold))
            allText = allText + Text(String(ebc)).font(.system(size: 12))
        }
        
        if let srm = beer.srm {
            allText = allText + Text(", ")
            allText = allText + Text("Messung für die Farbe: ").font(.system(size: 14, weight: .bold))
            allText = allText + Text(String(srm)).font(.system(size: 12))
        }
        
        if let ph = beer.ph {
            allText = allText + Text(", ")
            allText = allText + Text("PH-Wert: ").font(.system(size: 14, weight: .bold))
            allText = allText + Text(String(ph)).font(.system(size: 12))
        }
        
        return allText
    }
    
    func allIngredients() -> Text {
        var maltText = ""
        beer.ingredients.malt.forEach { maltItem in
            maltText += maltItem.name + ": " + String(maltItem.amount.value) + " " + maltItem.amount.unit
            maltText += ", "
        }
        
        var hopsText = ""
        for (index, hopsItem) in beer.ingredients.hops.enumerated() {
            hopsText += hopsItem.name + ": " + String(hopsItem.amount.value) + " " + hopsItem.amount.unit
            + ", " + hopsItem.add
            + ", " + hopsItem.attribute
            
            let count = beer.ingredients.hops.count
            hopsText += index == count-1 ? ", " : " | "
        }
        
        return Text("Malz: ").font(.system(size: 14, weight: .bold))
        + Text(maltText).font(.system(size: 12))
        + Text("Hopfen: ").font(.system(size: 14, weight: .bold))
        + Text(hopsText).font(.system(size: 12))
        + Text("Hefe: ").font(.system(size: 14, weight: .bold))
        + Text(beer.ingredients.yeast).font(.system(size: 12))
    }
}

#Preview {
    BeerDetailView(beer: Beer(
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
        contributedBy: "")
    )
}
