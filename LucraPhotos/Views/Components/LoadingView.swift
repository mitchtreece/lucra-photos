//
//  LoadingView.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        
        VStack {
            
            ProgressView()
            
            Text("Loading")
                .font(.headline)
            
        }
        .padding(24)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
        
    }
    
}
