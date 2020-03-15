//
//  URL+.swift
//  
//
//  Created by Zach Eriksen
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

import OpenCombine

public extension URL {
    func request(forRoute route: ASCAPI.Route?, withID id: Int? = nil) -> URLRequest {
        guard let route = route else {
            return URLRequest(url: self,
                              cachePolicy: .useProtocolCachePolicy,
                              timeoutInterval: 10.0)
        }

        let path = route.rawValue.replacingOccurrences(of: "_", with: "/")
        
        guard let id = id else {
            return URLRequest(url: appendingPathComponent(path),
                              cachePolicy: .useProtocolCachePolicy,
                              timeoutInterval: 10.0)
        }
        return URLRequest(url: appendingPathComponent("/\(path)/\(id)"),
                          cachePolicy: .useProtocolCachePolicy,
                          timeoutInterval: 10.0)
    }
}
