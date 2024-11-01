//
//  PhotoView.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import SwiftUI
import NukeUI

struct PhotoView: View {
    
    private let photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    var body: some View {
        
        LazyImage(url: self.photo.url) { state in
        
            if let image = state.image {
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }
            else if state.error != nil {
                
                Image(systemSymbol: .eyeSlash)
                    .font(.title)
                    .foregroundStyle(.gray)
                
            }
            else {
                
                ProgressView()
                    .tint(.gray)
                
            }
            
        }
        
    }
    
}
