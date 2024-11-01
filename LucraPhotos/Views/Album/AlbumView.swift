//
//  AlbumView.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import SwiftUI

struct AlbumView: View {
    
    @StateObject private var viewModel: AlbumViewModel
    @State private var isFavorite: Bool = false
    
    @Namespace private var namespace
    
    init(viewModel: AlbumViewModel) {
        self._viewModel = viewModel.asStateObject()
    }
    
    var body: some View {
        
        ScrollView {
            
            LazyVGrid(columns: [.init(.adaptive(minimum: 100))]) {
                
                ForEach(self.viewModel.photos) { photo in
                    
                    let route = NavRoute.photo(
                        photo: photo,
                        namespace: self.namespace
                    )
                    
                    NavigationLink(value: route) {
                        PhotoItemView(photo: photo)
                    }
                    .matchedTransitionSource(
                        id: photo.id,
                        in: namespace
                    )
                    
                }
                
            }
            .padding()
            
        }
        .navigationTitle("Album")
        .toolbar {
            
            Button {
                
                self.viewModel
                    .toggleFavorite()
                
            } label: {
               
                Image(systemSymbol: self.isFavorite ? .starFill : .star)
                
            }
            
        }
        .onReceive(self.viewModel.isFavorite) {
            self.isFavorite = $0
        }
        
    }
    
}
