//
//  FavoriteServiceMock.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Espresso
import Combine

class FavoriteServiceMock: FavoriteServiceProtocol {
    
    var serviceName: String { "Favorite (Mock)" }
    var serviceSymbol: String { "⭐️" }
    
    var albums: GuaranteePublisher<[Album]> {
        return Just([]).eraseToAnyPublisher()
    }
    
    func isFavorite(album: Album) -> Bool { false }
    func addFavorite(album: Album) {}
    func removeFavorite(album: Album) {}
    
}
