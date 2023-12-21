//
//  BeerListView.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import SwiftUI

struct BeerItemView: View {
    enum ImageState: Equatable {
        case loading
        case success(UIImage)
        case error
    }

    let beer: Beer
    @State var imageState: ImageState = .loading
    private let width = 50.0
    private let height = 50.0
    
    private var isLoading: Bool {
        imageState == .loading
    }
    
    var body: some View {
        
        HStack {
            switch imageState {
            case .loading:
                ProgressView()
                    .frame(width: width, height: height)
                    .isHidden(!isLoading)
            case .success(let image):
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
            case .error:
                Image(systemName: "waterbottle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
            }
            
            VStack(alignment: .leading) {
                Text(beer.name).font(Font.system(size: 17.0))
                    .multilineTextAlignment(.leading)
                Text(beer.tagline).font(Font.system(size: 14.0))
                    .multilineTextAlignment(.leading)
            }
        }
        .task {
            await loadImage()
        }
    }
    
    private func loadImage() async {
        if let image = await ImageLoader().loadImage(from: beer.imageUrl) {
            imageState = .success(image)
            return
        }
        imageState = .error
    }
}

#Preview {
    BeerItemView(beer: Beer.mock)
}

