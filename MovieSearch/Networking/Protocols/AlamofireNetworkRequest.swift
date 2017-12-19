//
//  NetworkManager.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/14/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation
import Alamofire

protocol AlamofireNetworkRequest {
    
    /**
     Send the alamofire network request to server and fetch the response against the the url request
     
     - parameter request: Creates a DownloadRequest to retrieve the contents the specified url, method, parameters, encoding.
     - parameter completionHandler: Data response fetched from the server.
     */
    func request(request: URLRequestConvertible,completionHandler: @escaping (DataResponse<Any>) -> Void)
}

extension AlamofireNetworkRequest{
    
    func request(request: URLRequestConvertible,completionHandler: @escaping (DataResponse<Any>) -> Void) {
        
        let manager = SessionManager.default
        manager.request(request).responseJSON(completionHandler: completionHandler)
        
    }
}
