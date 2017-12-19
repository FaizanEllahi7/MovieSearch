//
//  MovieSearchRequest.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/14/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation
import Alamofire


class MovieSearchRequest: NetworkRequestProtocol {
    
    /**
     Send the URLRequest to Alamofire Manager and fetch back the response.
     
     - parameter request: Creates a DownloadRequest to retrieve the contents the specified url, method, parameters, encoding.
     - parameter completionHandler: Send back the Result enum either success of failure depending on the server reponse
     */
    func searchMoviesWith(with request: URLRequestConvertible, completionHandler: @escaping (Result) -> Void){
        
        self.load(with: request) { (data : Movies?, error, success) in
            
            if success {
                
                completionHandler(.success(data!))
                
            } else {
                
                completionHandler(.failure(error!))
            }
        }
    }
}
