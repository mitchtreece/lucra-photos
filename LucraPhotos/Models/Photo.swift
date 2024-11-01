//
//  Photo.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Espresso

struct Photo: Identifiable, Hashable, Codable {
    
    let id: String
    let title: String?
    let description: String?
    let viewCount: Int
    let url: URL
        
    private enum CodingKeys: String, CodingKey {
        
        case id
        case title
        case description
        case viewCount = "views"
        case url = "link"
        
    }
    
}

extension Photo: Mockable {
    
    static func mock() -> Photo {
        
        return .init(
            id: UUID().uuidString,
            title: "Mock Photo",
            description: "A simple mock photo",
            viewCount: 32,
            url: URL(string: "https://styles.redditmedia.com/t5_2xr9v0/styles/communityIcon_mdl29v47oge51.png")!
        )
        
    }
    
}
