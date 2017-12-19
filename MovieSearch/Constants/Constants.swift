//
//  Constants.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

//MARK:- Network Request Constants
let basePath = "https://api.themoviedb.org/3/"
let searchMoviewURL = "search/movie/"
let api_key = "2696829a81b1b5827d515ff121700838"
let requestTimeOut: CFTimeInterval = 15.0
let imageURL = "http://image.tmdb.org/t/p/w92"
let requestJsonHeaders = ["Content-Type": "application/json"]

//MARK:- Search ViewController Constants
let resultsTableViewCellIdentifier = "searchResultCell"
let movieTableViewCellIdentifier = "movieTableViewCell"
let searchBarPlaceholderText = "Search Movies"

//MARK:- SearchViewModel Constants
let validTextError = "Enter a valid text for search"
let noDataTextError = "No data found on server"
