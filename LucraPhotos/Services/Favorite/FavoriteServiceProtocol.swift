//
//  FavoriteServiceProtocol.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Espresso

protocol FavoriteServiceProtocol: ServiceProtocol {
        
    var albums: GuaranteePublisher<[Album]> { get }
    
    func isFavorite(album: Album) -> Bool
    func addFavorite(album: Album)
    func removeFavorite(album: Album)
    
}
