//
//  PhotoDetailView.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import SwiftUI
import LazyPager

struct PhotoDetailView: View {
    
    @StateObject private var viewModel: PhotoDetailViewModel
    
    init(viewModel: PhotoDetailViewModel) {
        self._viewModel = viewModel.asStateObject()
    }
    
    var body: some View {
        
        LazyPager(data: [self.viewModel.photo]) { photo in
            PhotoView(photo: self.viewModel.photo)
        }
        .zoomable(min: 1, max: 5)
        .ignoresSafeArea()
        
    }
    
}
