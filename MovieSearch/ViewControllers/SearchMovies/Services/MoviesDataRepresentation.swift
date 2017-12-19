//
//  MoviesTableViewRepresentation.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

class MoviesDataRepresentation: TableViewRepresentable {
    
    //MARK:- Instance Variables
    var queryText: String
    var pagination: Pagination
    var movies: [MovieCellData]
    
    //MARK:- Methods
    /**
     Create a paginationa object that comfort the PaginationMetadata protocol and a movies list that comfort to MovieCellData protocol from the Movies data.
     
     - parameter moviesData: Movies Data returned from search result
     - parameter queryString: Query text used when load the nexy page
     */
    init(moviesData: Movies?, queryString: String) {
        
        queryText = queryString
        if let moviesList = moviesData {
            
            pagination = Pagination(page: moviesList.page, totalPages: moviesList.totalPages, totalResults: moviesList.totalResults)
            
            movies = [MovieCellData]()
            
            if let movieList = moviesList.moviesList {
                
                for i in 0 ..< movieList.count {
                    
                    let movie = MovieCellData(movieData: movieList[i])
                    self.movies.append(movie)
                }
            }
        } else {
            
            pagination = Pagination(page: 0, totalPages: 0, totalResults: 0)
            movies = [MovieCellData]()
        }
    }
    
    /**
     Update the query pagination information and append the next page movies in movies list.
     
     - parameter moviesData: Movies Data returned from search result
     */
    func updateMoviesData(moviesData: Movies?) {
        
        if let moviesList = moviesData {
            
            pagination.page = moviesList.page
            pagination.totalPages = moviesList.totalPages
            pagination.totalResults = moviesList.totalResults
            
            if let movieList = moviesList.moviesList {
                
                for i in 0 ..< movieList.count {
                    
                    let movie = MovieCellData(movieData: movieList[i])
                    self.movies.append(movie)
                }
            }
        }
    }
}
