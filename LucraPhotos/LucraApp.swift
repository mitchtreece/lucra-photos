//
//  LucraApp.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import SwiftUI
import Swinject

@main
struct LucraPhotosApp: App {
    
    init() {
                
        let assembler = Assembler([
            ServiceAssembly(),
            ModelAssembly()
        ])
        
        AppContainer.setup(
            resolver: assembler.synchronizedResolver
        )
        
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            let viewModel = AppContainer
                .models
                .rootView
            
            RootView(viewModel: viewModel)
            
        }
        
    }
    
}
