//
//  ImageLoader.swift
//  GiantBeers
//
//  Created by Yasin Makin on 20.12.23.
//

import Foundation
import SwiftUI

class ImageLoader {
    func loadImage(from url: URL) async -> UIImage? {
        let urlRequest = URLRequest(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            
            guard let image = UIImage(data: data) else {
                return nil
            }
            
            // Cache
            
            return image
        } catch {
            return nil
        }
    }
    
    private func fechImage(from url: URL)  {
        
    }
}
