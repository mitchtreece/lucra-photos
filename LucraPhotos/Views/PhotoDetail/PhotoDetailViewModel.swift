//
//  PhotoDetailViewModel.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Foundation

class PhotoDetailViewModel: ViewModel {
    
    private(set) var photo: Photo!
    
    @discardableResult
    func setup(photo: Photo) -> Self {
        
        self.photo = photo
        return self
        
    }
    
}
