//
//  Error.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/17/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

enum APIError: Error {
    
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case urlRequestnsuccessful
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        case .urlRequestnsuccessful: return "Error in request paramerts"
        }
    }
}
