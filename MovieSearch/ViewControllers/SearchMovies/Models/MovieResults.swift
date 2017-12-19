//
//  MovieResults.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

struct MovieResults: Decodable {
    
    let title: String?
    let overview: String?
    let releaseDate: String?
    let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case releaseDate = "release_date"
        case poster = "poster_path"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String?.self, forKey: .title)
        overview = try values.decode(String?.self, forKey: .overview)
        releaseDate = try values.decode(String?.self, forKey: .releaseDate)
        poster = try values.decode(String?.self, forKey: .poster)
    }
}
