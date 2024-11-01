//
//  FavoriteService.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Espresso

class FavoriteService: FavoriteServiceProtocol {
    
    var serviceName: String { "Favorite" }
    var serviceSymbol: String { "⭐️" }
    
    @Published private(set) var _albums: [Album] = []
    var albums: GuaranteePublisher<[Album]> {
        return self.$_albums.eraseToAnyPublisher()
    }
    
    func isFavorite(album: Album) -> Bool {
        
        return self._albums
            .contains(album)
        
    }
    
    func addFavorite(album: Album) {
        
        guard !isFavorite(album: album) else {
            return
        }
        
        log("Adding favorite album: \(album.id)")
        
        self._albums
            .append(album)
        
    }
    
    func removeFavorite(album: Album) {
        
        if let idx = self._albums.firstIndex(of: album) {
            
            log("Removing favorite album: \(album.id)")
            
            self._albums
                .remove(at: idx)
            
        }
        
    }
    
    // MARK: Private
    
    private func log(_ message: String) {
        print("\(self.serviceSymbol) [\(self.serviceName)] - \(message)")
    }
    
}
