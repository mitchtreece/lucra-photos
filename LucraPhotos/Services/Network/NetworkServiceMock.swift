//
//  NetworkServiceMock.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Espresso

class NetworkServiceMock: NetworkServiceProtocol {
    
    var serviceName: String { "Network (Mock)" }
    var serviceSymbol: String { "🌎" }
    
    func albumSearch(query: String) async throws -> [Album] {
        return Album.mocks()
    }
    
}
