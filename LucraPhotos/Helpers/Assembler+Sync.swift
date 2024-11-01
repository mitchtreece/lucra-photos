//
//  Assembler+Sync.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Swinject

extension Assembler {
    
    var synchronizedResolver: Resolver {
        
        let res = self.resolver
        
        if let container = res as? Container {
            return container.synchronize()
        }
        
        return res
        
    }
    
}
