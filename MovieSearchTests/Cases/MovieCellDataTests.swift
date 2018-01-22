//
//  MovieCellDataTests.swift
//  MovieSearchTests
//
//  Created by Faizan Ellahi on 12/18/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import XCTest
@testable import MovieSearch

class MovieCellDataTests: XCTestCase {
    
    func testMovieCellData() throws {
        
        let mockdata = MockDataProvider()
        let movieList = mockdata.getMockMoviesList()
        
        var movie = MovieCellData(movieData: movieList!.moviesList!.first!)
        XCTAssertEqual(movie.movieDate, "1989-06-23")
        XCTAssertEqual(movie.movieName, "Batman")
        XCTAssertEqual(movie.movieOverview, "The Dark Knight of Gotham City begins his war on crime with his first major enemy being the clownishly homicidal Joker, who has seized control of Gotham's underworld.")
        XCTAssertEqual(movie.moviePoster, imageURL + "/kBf3g9crrADGMc2AMAMlLBgSm2h.jpg")
        
        movie = MovieCellData(movieData: movieList!.moviesList![7])
        XCTAssertEqual(movie.movieDate, "2017-11-14")
        XCTAssertEqual(movie.movieName, "Batman vs. Two-Face")
        XCTAssertEqual(movie.movieOverview, "Former Gotham City District Attorney Harvey Dent, one side of his face scarred by acid, goes on a crime spree based on the number '2'. All of his actions are decided by the flip of a defaced, two-headed silver dollar.")
        XCTAssertEqual(movie.moviePoster, imageURL + "/yTbj8Kcp4WFwMRdEejnn55KIsfH.jpg")
        
        movie = MovieCellData(movieData: movieList!.moviesList!.last!)
        XCTAssertEqual(movie.movieDate, "2016-07-21")
        XCTAssertEqual(movie.movieName, "Batman: The Killing Joke")
        XCTAssertEqual(movie.movieOverview, "As Batman hunts for the escaped Joker, the Clown Prince of Crime attacks the Gordon family to prove a diabolical point mirroring his own fall into madness. Based on the graphic novel by Alan Moore and Brian Bolland.")
        XCTAssertEqual(movie.moviePoster, imageURL + "/zm0ODjtfJfJW0W269LqsQl5OhJ8.jpg")
        
    }
}
