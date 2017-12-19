//
//  MovieSearchResult.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

/**
 Enum used to find the search result of a particular is either successful or failure .
 */
enum MovieSearchResult{
    
    case success
    case failure(error: String)
    case noResult(error: String)
}
