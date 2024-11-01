//
//  RootView.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import SwiftUI

struct RootView: View {
    
    @StateObject private var viewModel: RootViewModel
    
    init(viewModel: RootViewModel) {
        self._viewModel = viewModel.asStateObject()
    }
    
    var body: some View {
        
        NavigationStack {
            
            let viewModel = AppContainer
                .models
                .albumListView
            
            AlbumListiew(
                viewModel: viewModel
            )
            .navigationDestination(for: NavRoute.self) { route in
                route.view
            }
            
        }
        
    }
    
}
