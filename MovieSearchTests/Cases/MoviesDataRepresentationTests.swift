//
//  MoviesDataRepresentationTests.swift
//  MovieSearchTests
//
//  Created by Faizan Ellahi on 12/19/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import XCTest
@testable import MovieSearch

class MoviesDataRepresentationTests: XCTestCase {
    
    var movieList: Movies?
    
    override func setUp() {
        super.setUp()
        
        //Load data from json
        let mockdata = MockDataProvider()
        movieList = mockdata.getMockMoviesList()
    }
    
    func testMoviesDataRepresentation() {
        
        let moviesRepresentation = MoviesDataRepresentation(moviesData: movieList, queryString: "Batman")
        XCTAssertEqual(moviesRepresentation.pagination.page, 1)
        XCTAssertEqual(moviesRepresentation.pagination.totalPages, 5)
        XCTAssertEqual(moviesRepresentation.pagination.totalResults, 98)
        XCTAssertEqual(moviesRepresentation.pagination.hasnextPage(), true)
        XCTAssertEqual(moviesRepresentation.queryText, "Batman")
        XCTAssertEqual(moviesRepresentation.movies.count, 20)
        XCTAssertEqual(moviesRepresentation.movies.first!.movieDate, "1989-06-23")
        XCTAssertEqual(moviesRepresentation.movies.first!.movieName, "Batman")
        XCTAssertEqual(moviesRepresentation.movies.first!.movieOverview, "The Dark Knight of Gotham City begins his war on crime with his first major enemy being the clownishly homicidal Joker, who has seized control of Gotham's underworld.")
        XCTAssertEqual(moviesRepresentation.movies.first!.moviePoster, imageURL + "/kBf3g9crrADGMc2AMAMlLBgSm2h.jpg")
    }
    
    func testupdateMoviesData() {
        
        let moviesRepresentation = MoviesDataRepresentation(moviesData: movieList, queryString: "Batman")
        moviesRepresentation.updateMoviesData(moviesData: movieList)
        XCTAssertEqual(moviesRepresentation.movies.count, 40)
    }
}
