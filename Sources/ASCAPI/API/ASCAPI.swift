//
//  ASCAPI.swift
//  
//
//  Created by Zach Eriksen
//

import Foundation
import OpenCombine

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public class ASCAPI {
    public enum Route: String {
        case account
    }
    
    public static var instance: ASCAPI = {
        ASCAPI()
    }()
    
    // Configuations
    public var apiKey: String?
    
    // Constants
    internal let path: String = "https://api.appstoreconnect.apple.com"
    
    // Lazy Variables
    internal lazy var url: URL = URL(string: path)!
}