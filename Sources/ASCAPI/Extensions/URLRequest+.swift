//
//  URLRequest+.swift
//  
//
//  Created by Zach Eriksen
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

import OpenCombine
import OpenCombineFoundation

public extension URLRequest {
    mutating func dataTaskPublish(method: String = "GET", withBody body: Data? = nil) -> URLSession.OCombine.DataTaskPublisher {
        guard let apiKey = ASCAPI.instance.apiKey else {
            fatalError("You have not set the ASC API Key")
        }
        
        let headers = [
            "Content-Type": "application/json; charset=utf-8",
            "cache-control": "no-cache",
            "Authorization": "Bearer \(apiKey)"
        ]
        
        httpMethod = method
        allHTTPHeaderFields = headers
        if let body = body {
            httpBody = body
        }
        
        let session = URLSession.shared.ocombine
        return session.dataTaskPublisher(for: self)
    }
}
