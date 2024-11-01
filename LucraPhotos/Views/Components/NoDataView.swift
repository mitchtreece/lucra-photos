//
//  NoDataView.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import SwiftUI
import SFSafeSymbols

struct NoDataView: View {

    private let symbol: SFSymbol
    private let title: String
    private let message: String?
    
    init(symbol: SFSymbol,
         title: String,
         message: String?) {
        
        self.symbol = symbol
        self.title = title
        self.message = message
        
    }
    
    var body: some View {
        
        VStack {
            
            Image(systemSymbol: self.symbol)
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .colorMultiply(.secondary)
            
            Text(self.title)
                .font(.headline)
                .tint(.primary)
            
            if let message {
                
                Text(message)
                    .font(.body)
                    .tint(.secondary)
                
            }
            
        }
        
    }
    
}
