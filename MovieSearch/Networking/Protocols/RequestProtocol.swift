//
//  APIRoutering.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/16/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestProtocol {
    
    /**
     The HTTP method used to perform the request.
     */
    var methodType: Alamofire.HTTPMethod { get }
    
    /**
     Encoded data to carry out with the request.
     */
    var encoding: Alamofire.ParameterEncoding? { get }
    
    /**
     Build up and return the URL for each endpoint. Parameters used to compose the endpoint url.
     */
    var url: URL { get }
    
    /**
     Parameters used to compose the fields dictionary into the url.
     */
    var parameters: Data? { get }
    
    /**
     Return true if the next page available in the search response otherwise return false.
     */
    var baseUrl: String { get }
    
    /**
     the headers to send along the request.
     */
    var httpHeaders: [String : String]? { get }
    
    /**
     Timeout of the request.
     */
    var requestTimeout: CFTimeInterval? { get }
}
