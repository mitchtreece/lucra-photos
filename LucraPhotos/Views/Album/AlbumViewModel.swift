//
//  AlbumViewModel.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Espresso

class AlbumViewModel: ViewModel {
    
    private let favorite: FavoriteServiceProtocol
        
    var isFavorite: GuaranteePublisher<Bool> {
        
        return self.favorite
            .albums
            .map { $0.contains(self.album) }
            .removeDuplicates()
            .eraseToAnyPublisher()
        
    }
    
    var photos: [Photo] {
        return self.album.photos
    }
    
    private var album: Album!
    
    init(favorite: FavoriteServiceProtocol) {
        self.favorite = favorite
    }
    
    @discardableResult
    func setup(album: Album) -> Self {
        
        self.album = album
        return self
        
    }
    
    func toggleFavorite() {
        
        if !self.favorite.isFavorite(album: self.album) {
                        
            self.favorite
                .addFavorite(album: album)
            
        }
        else {
            
            self.favorite
                .removeFavorite(album: album)
            
        }
        
    }
    
}
