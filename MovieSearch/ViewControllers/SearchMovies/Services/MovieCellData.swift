//
//  MovieCellData.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

class MovieCellData: MovieRepresentable {
    
    var movieName: String
    var movieDate: String
    var movieOverview: String
    var moviePoster: String
    
    init(movieData: MovieResults) {
        
        movieName = movieData.title ?? "-"
        movieDate = movieData.releaseDate ?? "-"
        movieOverview = movieData.overview ?? "-"
        moviePoster = imageURL + (movieData.poster ?? "")
    }
}
