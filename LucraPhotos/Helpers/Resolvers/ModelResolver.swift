//
//  ModelResolver.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Swinject

class ModelResolver: BaseResolver {
    
    override init() {}
    
    var rootView: RootViewModel {
        return self.resolver.resolve(RootViewModel.self)!
    }
    
    var albumListView: AlbumListViewModel {
        return self.resolver.resolve(AlbumListViewModel.self)!
    }
    
    var albumView: AlbumViewModel {
        return self.resolver.resolve(AlbumViewModel.self)!
    }
    
    var photoDetailView: PhotoDetailViewModel {
        return self.resolver.resolve(PhotoDetailViewModel.self)!
    }
    
}

class ModelAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(RootViewModel.self) { r in
            return RootViewModel()
        }.inObjectScope(.transient)
        
        container.register(AlbumListViewModel.self) { r in
            
            return AlbumListViewModel(
                network: r.resolve(NetworkServiceProtocol.self)!,
                favorite: r.resolve(FavoriteServiceProtocol.self)!
            )
            
        }.inObjectScope(.transient)
        
        container.register(AlbumViewModel.self) { r in
            
            return AlbumViewModel(
                favorite: r.resolve(FavoriteServiceProtocol.self)!
            )
            
        }.inObjectScope(.transient)
        
        container.register(PhotoDetailViewModel.self) { _ in
            return PhotoDetailViewModel()
        }.inObjectScope(.transient)
        
    }
    
}
