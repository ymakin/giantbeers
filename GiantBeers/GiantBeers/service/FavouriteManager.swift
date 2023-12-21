//
//  FavouriteManager.swift
//  GiantBeers
//
//  Created by Yasin Makin on 21.12.23.
//

import Foundation

class FavouriteManager {
    let userDefaults: UserDefaults
    private let key = "nanogiants.favourites"
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    func add(id: Int) {
        var loadedFavourites = load()
        if !loadedFavourites.contains(where: { $0 == id }) {
            loadedFavourites.append(id)
        }
        userDefaults.set(loadedFavourites, forKey: key)
    }
    
    func remove(id: Int) {
        var loadedFavourites = load()
        if let index = loadedFavourites.firstIndex(of: id) {
            loadedFavourites.remove(at: index)
        }
        userDefaults.set(loadedFavourites, forKey: key)
    }
    
    func load() -> [Int] {
        guard let favourites = userDefaults.array(forKey: key) as? [Int] else {
            return [Int]()
        }
        return favourites
    }
    
    func isFavourite(id: Int) -> Bool {
        load().contains(where: { $0 == id })
    }
}
