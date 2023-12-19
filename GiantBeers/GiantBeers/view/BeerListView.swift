//
//  BeerListView.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import SwiftUI

struct BeerListView: View {
    let name: String
    let tagline: String
    
    var body: some View {
        HStack {
            Image(systemName: "waterbottle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(name).font(Font.system(size: 17.0))
                    .multilineTextAlignment(.leading)
                Text(tagline).font(Font.system(size: 14.0))
                    .multilineTextAlignment(.leading)
            }
        }
        
    }
}

#Preview {
    BeerListView(name: "Beer 1", tagline: "A Real Bitter Experience.")
}
