//
//  NetworkRequest.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/14/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkRequestProtocol: AlamofireNetworkRequest {
    
    /**
     Send the URLRequest to Alamofire Manager and fetch the response from the AlamofireNertworkRequest calss
     
     - parameter request: Creates a DownloadRequest to retrieve the contents the specified url, method, parameters, encoding.
     - parameter completionHandler: Data response fetched from the server.
     */
    func load<T: Decodable>(with request: URLRequestConvertible, withCompletion completion: @escaping (_ response: T?, _ error: Error?, _ success: Bool) -> Void)
}

extension NetworkRequestProtocol {
    
    func load<T: Decodable>(with request: URLRequestConvertible, withCompletion completion: @escaping (_ response: T?, _ error: Error?, _ success: Bool) -> Void) {
        
        self.request(request: request) { (response) in
            
            guard response.error == nil else {
                completion(nil, APIError.requestFailed, false)
                return
            }
            
            if self.isValidatStatusCode(statusCode: response.response?.statusCode) {
                
                if let jsonResponse = response.data {
                    do {
                        let jsonResponse = try JSONDecoder().decode(T.self, from: jsonResponse)
                        print("json response id \(jsonResponse)")
                        completion(jsonResponse, nil, true)
                    }
                    catch {
                        
                        completion(nil, APIError.jsonConversionFailure, false)
                    }
                } else {
                    
                    completion(nil, APIError.invalidData, false)
                }
            } else {
                
                completion(nil, APIError.responseUnsuccessful, false)
            }
        }
    }
    
    func isValidatStatusCode(statusCode: Int?) -> Bool {
        
        if (statusCode != nil && statusCode! > 200 && statusCode! < 300) {
            
            return true
        }
        else{
            
            return false
        }
    }
}


