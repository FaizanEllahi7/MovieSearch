//
//  AlamofireRouterRequest.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/17/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation
import Alamofire

enum AlamofireRouterRequest: URLRequestConvertible, RequestProtocol {
    
    case searchMovie(SearchMovieParamerters)
    
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = methodType.rawValue
        do {
            urlRequest =  try URLEncoding.queryString.encode(urlRequest, with: parametersDict)
        }
        return urlRequest
    }
    
    var methodType: HTTPMethod {
        
        switch(self) {
            
        case .searchMovie:
            return .post
        }
    }
    
    var encoding: ParameterEncoding? {
        
        return JSONEncoding.default
    }
    
    var url: URL {
        
        let relativePath: String?
        
        switch(self) {
            
        case .searchMovie:
            relativePath =  searchMoviewURL
        }
        
        var url = URL(string: baseUrl)!
        if let relativePath = relativePath {
            url = url.appendingPathComponent(relativePath)
        }
        return url
    }
    
    var parametersDict: ([String: Any]?) {
        
        switch(self) {
            
        case .searchMovie(let params):
            return ["query": params.query,
                    "api_key": api_key,
                    "page": params.page]
        }
    }
    
    var parameters: Data? {
        
        do {
            switch(self) {
                
            case .searchMovie(let params):
                let body = try JSONEncoder().encode(params)
                return body
            }
        }
        catch {
            
            return nil
        }
    }
    
    var baseUrl: String {
        
        return basePath
    }
    
    var httpHeaders: [String : String]? {
        
        return requestJsonHeaders
    }
    
    var requestTimeout: CFTimeInterval? {
        
        return requestTimeOut
    }
}
