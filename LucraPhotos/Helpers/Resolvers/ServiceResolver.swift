//
//  ServiceResolver.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Swinject

class ServiceResolver: BaseResolver {
    
    override init() {}
    
    var network: NetworkServiceProtocol {
        return self.resolver.resolve(NetworkServiceProtocol.self)!
    }
    
    var favorite: FavoriteServiceProtocol {
        return self.resolver.resolve(FavoriteServiceProtocol.self)!
    }
    
}

class ServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(NetworkServiceProtocol.self) { r in
            NetworkService()
        }.inObjectScope(.container)
        
        container.register(FavoriteServiceProtocol.self) { _ in
            return FavoriteService()
        }.inObjectScope(.container)
        
    }
    
}
