//
//  PaginationTests.swift
//  MovieSearchTests
//
//  Created by Faizan Ellahi on 12/18/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import XCTest
@testable import MovieSearch

class PaginationTests: XCTestCase {
    
    func testPaginationData() {
        
        var pagination = Pagination(page: 1, totalPages: 5, totalResults: 78)
        XCTAssertEqual(pagination.page, 1)
        XCTAssertEqual(pagination.totalPages, 5)
        XCTAssertEqual(pagination.totalResults, 78)
        
        pagination = Pagination(page: 2, totalPages: 3, totalResults: 102)
        XCTAssertEqual(pagination.page, 2)
        XCTAssertEqual(pagination.totalPages, 3)
        XCTAssertEqual(pagination.totalResults, 102)
        
    }
    
    func testHasNextPage() {
        
        var pagination = Pagination(page: 1, totalPages: 5, totalResults: 78)
        XCTAssertTrue(pagination.hasnextPage())
        
        pagination = Pagination(page: 4, totalPages: 5, totalResults: 50)
        XCTAssertTrue(pagination.hasnextPage())
        
        pagination = Pagination(page: 5, totalPages: 5, totalResults: 10)
        XCTAssertFalse(pagination.hasnextPage())
        
        pagination = Pagination(page: 5, totalPages: 3, totalResults: 80)
        XCTAssertFalse(pagination.hasnextPage())
        
    }
}
