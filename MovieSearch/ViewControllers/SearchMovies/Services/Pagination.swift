//
//  Pagination.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

class Pagination: PaginationMetadata {
    
    var page: Int?
    var totalPages: Int?
    var totalResults: Int?
    
    required init(page: Int?, totalPages: Int?, totalResults: Int?){
        
        self.page = page
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}
