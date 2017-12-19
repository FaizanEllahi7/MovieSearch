//
//  PaginationMetadata.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

protocol PaginationMetadata {
    
    var page: Int? {get}
    var totalResults: Int? {get}
    var totalPages: Int? {get}
    
    init(page: Int?, totalPages: Int?, totalResults: Int?)
}

extension PaginationMetadata {
    
    /**
     Return true if the next page available in the search response otherwise return false.
     */
    func hasnextPage() -> Bool {
        
        guard page != nil, totalPages != nil else {return false}
        return totalPages! > page! ? true : false
    }
}
