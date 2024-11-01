//
//  NavRoute.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import SwiftUI
import EspressoUI

enum NavRoute: Hashable {
    
    case album(Album)
    case photo(photo: Photo, namespace: Namespace.ID)
    
}

extension NavRoute {
    
    var view: some View {
        
        switch self {
        case .album(let album):
            
            let viewModel = AppContainer
                .models
                .albumView
                .setup(album: album)
            
            return AlbumView(
                viewModel: viewModel
            ).asAnyView()
            
        case .photo(let photo, let namespace):
            
            let viewModel = AppContainer
                .models
                .photoDetailView
                .setup(photo: photo)
            
            return PhotoDetailView(
                viewModel: viewModel
            )
            .navigationTransition(.zoom(sourceID: photo.id, in: namespace))
            .asAnyView()
            
        }
                
    }
    
}
