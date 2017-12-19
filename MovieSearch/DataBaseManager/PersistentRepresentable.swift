//
//  PersistentRepresentable.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/14/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

protocol PersistentRepresentable {
    
    func save(name: String)
    func searchHistory() -> [String]
}
