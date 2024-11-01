//
//  NetworkServiceProtocol.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Foundation

protocol NetworkServiceProtocol: ServiceProtocol {
    
    func albumSearch(query: String) async throws -> [Album]
    
}
