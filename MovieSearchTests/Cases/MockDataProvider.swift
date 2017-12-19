//
//  MockDataProvider.swift
//  MovieSearchTests
//
//  Created by Faizan Ellahi on 12/19/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import XCTest
@testable import MovieSearch

class MockDataProvider: XCTestCase {
    
    func getMockMoviesList () -> Movies? {
        
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "response", ofType: "json") else {
            fatalError("response.json not found")
        }
        guard let jsonString = try? NSString(contentsOfFile: pathString, encoding: String.Encoding.utf8.rawValue) else {
            fatalError("Unable to convert response.json to String")
        }
        guard let jsonData = jsonString.data(using: String.Encoding.utf8.rawValue) else {
            fatalError("Unable to convert response.json to NSData")
        }
        do {
            let movieList = try JSONDecoder().decode(Movies.self, from: jsonData)
            return movieList
        }
        catch {
            print("Error in json parsing")
        }
        
        return nil
    }
}
