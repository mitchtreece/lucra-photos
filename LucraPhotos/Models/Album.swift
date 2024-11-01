//
//  Album.swift
//  LucraPhotos
//
//  Created by Mitch Treece on 10/31/24.
//

import Espresso

struct Album: Identifiable, Hashable, Codable {
    
    let id: String
    let title: String?
    let description: String?
    let imageCount: Int
    let viewCount: Int
    let url: URL
    let photos: [Photo]
    
    private enum CodingKeys: String, CodingKey {
        
        case id
        case title
        case description
        case imageCount = "images_count"
        case viewCount = "views"
        case url = "link"
        case photos = "images"
        
    }
    
    private enum ImageListCodingKeys: String, CodingKey {
        case images
    }
    
    init(from decoder: any Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.imageCount = try container.decode(Int.self, forKey: .imageCount)
        self.viewCount = try container.decode(Int.self, forKey: .viewCount)
        self.url = try container.decode(URL.self, forKey: .url)
        
        var photoArrayContainer = try container.nestedUnkeyedContainer(forKey: .photos)
        var photoArray = [Photo]()
        
        while !photoArrayContainer.isAtEnd {
            photoArray.append(try photoArrayContainer.decode(Photo.self))
        }
        
        self.photos = photoArray
        
    }
    
}

extension Album: Mockable {
    
    static func mock() -> Album {
        
        return .init(json: [
            "id": UUID().uuidString,
            "title": "Mock Album",
            "description": "A simple mock album",
            "images_count": 1,
            "views": 23,
            "url": "https://imgur.com/a/crumble-s-daily-picture-TmjKu3i",
            "images": [
                Photo.mock().asJson()!
            ]
        ])!
        
    }
    
}
