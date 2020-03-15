//
//  ASCAPI+.swift
//  
//
//  Created by Zach Eriksen
//
import JWT
import Foundation
import OpenCombine

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public extension ASCAPI {
    func fetch(route: Route?) -> AnyPublisher<Any, Error> {
        var request = url.request(forRoute: route)
        
        return request.dataTaskPublish()
            .mapError { $0 as Error }
            .compactMap {
                do {

                    return try JSONSerialization.jsonObject(with: $0.data, options: [])
                } catch {
                    print("Error: \(error)")
                    return nil
                }
        }
        .eraseToAnyPublisher()
    }
    
    func get<T: Codable>(route: Route?) -> AnyPublisher<T, Error> {
        var request = url.request(forRoute: route)
        
        return request.dataTaskPublish()
            .mapError { $0 as Error }
            .compactMap {
                do {
                    return try JSONDecoder().decode(T.self, from: $0.data)
                } catch {
                    print("Error: \(error)")
                    return nil
                }
        }
        .eraseToAnyPublisher()
    }
}