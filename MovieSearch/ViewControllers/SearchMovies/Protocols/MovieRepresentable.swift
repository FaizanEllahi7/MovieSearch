//
//  MovieRepresentable.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation


protocol MovieRepresentable {
    
    var movieName: String { get }
    var movieDate: String { get }
    var movieOverview: String { get }
    var moviePoster: String { get }
}
