//
//  Movies.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

struct Movies: Decodable {
    let page: Int?
    let totalResults: Int?
    let totalPages: Int?
    
    let moviesList: [MovieResults]?
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case moviesList = "results"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decode(Int?.self, forKey: .page)
        totalResults = try values.decode(Int?.self, forKey: .totalResults)
        totalPages = try values.decode(Int?.self, forKey: .totalPages)
        moviesList = try values.decode([MovieResults]?.self, forKey: .moviesList)
    }
}
