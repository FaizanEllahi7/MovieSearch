//
//  MovieSearchViewModelTests.swift
//  MovieSearchTests
//
//  Created by Faizan Ellahi on 12/19/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import XCTest
@testable import MovieSearch

class MovieSearchViewModelTests: XCTestCase {
    
    var movieList: Movies?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //Load data from json
        let mockdata = MockDataProvider()
        movieList = mockdata.getMockMoviesList()
    }
    
    func testMovieSearchViewModel() throws {
        
        let viewModel = MovieSearchViewModel()
        
        viewModel.createSearchResult(from: movieList, queryString: "Batman")
        
        XCTAssertEqual(viewModel.queryResult.pagination.page, 1)
        XCTAssertEqual(viewModel.queryResult.pagination.totalResults, 98)
        XCTAssertEqual(viewModel.queryResult.pagination.totalPages, 5)
        XCTAssertEqual(viewModel.queryResult.queryText, "Batman")
        XCTAssertEqual(viewModel.queryResult.movies.count, 20)
        XCTAssertEqual(viewModel.queryResult.pagination.hasnextPage(), true)
    }
    
    func testMovieSearchResult() throws {
        
        let viewModel = MovieSearchViewModel()
        let promise = expectation(description: "Status code: 200")
        
        viewModel.getMockQueryResult { (data: Result?) in
            
            switch data {
            case .none:
                break
            case .some(_):
                promise.fulfill()
            }
        }
        waitForExpectations(timeout: 15.0, handler: nil)
    }
}
