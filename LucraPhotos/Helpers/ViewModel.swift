//
//  ViewModel.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import SwiftUI

protocol ViewModel: ObservableObject {}

extension ViewModel {
    
    func asStateObject() -> StateObject<Self> {
        return .init(wrappedValue: self)
    }
    
}
