//
//  SearchMoviesParamerters.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/17/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

struct SearchMovieParamerters: Encodable {
    
    let query: String
    let api_key: String
    let page: Int
}
