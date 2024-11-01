//
//  NetworkService.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Spider

enum NetworkError: Error {
    
    case badResponse
    case decoding
    
}

class NetworkService: NetworkServiceProtocol {
    
    var serviceName: String { "Network" }
    var serviceSymbol: String { "🌎" }
    
    private let spider = Spider()
    
    func albumSearch(query: String) async throws -> [Album] {
        
        let req = buildRequest(
            method: .get,
            path: "https://api.imgur.com/3/gallery/search?q=\(query)"
        )
        
        let json = try await self.spider
            .perform(req)
            .jsonThrowing()
        
        guard let jsonArray = json["data"] as? [JSON] else {
            throw NetworkError.badResponse
        }
        
        guard let albums = Album.from(jsons: jsonArray) else {
            throw NetworkError.decoding
        }
                
        return albums
            .filter { !$0.photos.isEmpty }
        
    }
    
    // MARK: Private
    
    private func buildRequest(method: HTTPMethod,
                              path: String,
                              parameters: JSON? = nil) -> Request {
        
        let req = Request(
            method: method,
            path: path,
            parameters: parameters
        )
        
        req.headers.set(
            value: "Client-ID 2d086962f60c89e",
            forField: "Authorization"
        )
        
        return req
        
    }
    
}
