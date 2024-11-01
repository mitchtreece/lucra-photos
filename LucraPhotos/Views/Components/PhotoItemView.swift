//
//  PhotoItemView.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import SwiftUI
import NukeUI
import SFSafeSymbols

struct PhotoItemView: View {
    
    private let photo: Photo?
    
    private let cornerRadius: CGFloat = 8
    
    init(photo: Photo?) {
        self.photo = photo
    }

    var body: some View {
        
        ZStack {
            
            Color.secondary
                .opacity(0.2)
                .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
            
            LazyImage(url: self.photo?.url) { state in
            
                if let image = state.image {
                    
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                }
                else if self.photo?.url == nil || state.error != nil {
                    
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
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: self.cornerRadius))
        .aspectRatio(1, contentMode: .fit)
        .shadow(radius: 2)
        
    }
    
}
