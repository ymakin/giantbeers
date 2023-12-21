//
//  DetailBeerView.swift
//  GiantBeers
//
//  Created by Yasin Makin on 20.12.23.
//

import SwiftUI

struct BeerDetailView: View {
    let beer: Beer
    let favouriteManager: FavouriteManager
    
    init(beer: Beer, favouriteManager: FavouriteManager = FavouriteManager()) {
        self.beer = beer
        self.favouriteManager = favouriteManager
    }
    
    @State var isFavourite: Bool = false
    
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
                            Text("\(beer.name) - \(beer.tagline)")
                                .font(Font.system(size: 18.0, weight: .bold))
                                .foregroundColor(AppColor.primaryColor)
                            
                            Text("Gebraut: \(beer.firstBrewed)")
                            Text("Liter: \(beer.volume.value)")
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            title(text: "Beschreibung:")
                            Text(beer.description)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            title(text: "Werte:")
                            units
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            title(text: "Zutaten:")
                            ingredients
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            title(text: "Empfehlung Essen:")
                            VStack(alignment: .leading) {
                                ForEach(beer.foodPairing, id: \.self) {
                                    Text("* \($0)")
                                        .font(.system(size: 14.0, weight: .bold))
                                }
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            title(text: "Tipps:")
                            Text(beer.brewersTips)
                                .font(.system(size: 14.0))
                        }
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                    
                }
            }
            .navigationTitle(beer.name)
            .toolbar {
                Button {
                    isFavourite
                    ? favouriteManager.remove(id: beer.id)
                    : favouriteManager.add(id: beer.id)
                    
                    isFavourite.toggle()
                } label: {
                    Image(systemName: isFavourite ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                }
            }
            .onAppear() {
                isFavourite = favouriteManager.isFavourite(id: beer.id)
            }
        }
    }
    
    private var units: Text {
        var texts = [
            detailsCopy(title: "Alk. Gehalt", text: String(beer.abv)),
            detailsCopy(title: "Restextrakt", text: String(beer.target_fg)),
            detailsCopy(title: "Stammwürze", text: String(beer.target_og))
        ]
        
        if let ibu = beer.ibu {
            texts.append(detailsCopy(title: "Bitterkeit", text: String(ibu)))
        }
        
        if let ebc = beer.ebc {
            texts.append(detailsCopy(title: "Farbe", text: String(ebc)))
        }
        
        if let srm = beer.srm {
            texts.append(detailsCopy(title: "Messung für die Farbe", text: String(srm)))
        }

        if let ph = beer.ph {
            texts.append(detailsCopy(title: "PH-Wert", text: String(ph)))
        }
        
        return texts.joined(separator: ", ")
    }
    
    private var ingredients: Text {
        [
            detailsCopy(title: "Malz", text: beer.ingredients.malt.stringRepresentation),
            detailsCopy(title: "Hopfen", text: beer.ingredients.hops.stringRepresentation),
            detailsCopy(title: "Hefe", text: beer.ingredients.yeast)
        ].joined(separator: ", ")
    }
    
    private func detailsCopy(title: String, text: String) -> Text {
        bold(text: "\(title): ") + copy(text: text)
    }
    
    private func title(text: String) -> Text {
        Text(text)
            .font(Font.system(size: 18.0, weight: .bold))
            .foregroundColor(AppColor.primaryColor)
    }
    
    private func bold(text: String) -> Text {
        Text(text).font(.system(size: 14, weight: .bold))
    }
    
    private func copy(text: String) -> Text {
        Text(text).font(.system(size: 12))
    }
}

#Preview {
    BeerDetailView(beer: Beer.mock)
}
