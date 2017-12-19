//
//  SearchMovieParamertersTests.swift
//  MovieSearchTests
//
//  Created by Faizan Ellahi on 12/19/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import XCTest
@testable import MovieSearch

class SearchMovieParamertersTests: XCTestCase {
    
    func testSearchMovieParamerters() {
        
        var movieParamerters = SearchMovieParamerters(query: "Batman", api_key: api_key, page: 1)
        XCTAssertEqual(movieParamerters.query, "Batman")
        XCTAssertEqual(movieParamerters.api_key, api_key)
        XCTAssertEqual(movieParamerters.page, 1)
        
        movieParamerters = SearchMovieParamerters(query: "Thor", api_key: api_key, page: 2)
        XCTAssertEqual(movieParamerters.query, "Thor")
        XCTAssertEqual(movieParamerters.api_key, api_key)
        XCTAssertEqual(movieParamerters.page, 2)
        
    }
    
}
