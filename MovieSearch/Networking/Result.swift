//
//  Result.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/17/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

public enum Result{
    
    case success(Decodable)
    case failure(Error)
}

