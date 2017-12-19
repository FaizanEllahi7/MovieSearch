//
//  TableViewRepresentable.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation


protocol TableViewRepresentable {
    
    var pagination: Pagination { get }
    var movies : [MovieCellData] { get }
}
