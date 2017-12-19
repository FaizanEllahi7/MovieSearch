//
//  QueryResult.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

protocol QueryResult {
    
    var searchResult: Dynamic<MovieSearchResult> { get }
}
