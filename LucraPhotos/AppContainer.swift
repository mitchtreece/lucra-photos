//
//  AppContainer.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Swinject

class AppContainer {
        
    static let models = ModelResolver()
    static let services = ServiceResolver()
    
    private init() {}
    
    static func setup(resolver: Resolver) {
        
        self.models
            .setup(resolver: resolver)
        
        self.services
            .setup(resolver: resolver)
        
    }
    
}
