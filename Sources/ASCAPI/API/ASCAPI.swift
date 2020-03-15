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
        case apps
    }

    public static var instance: ASCAPI = {
        ASCAPI()
    }()

    // Configuations
    public var token: String?

    // Constants
    internal let path: String = "https://api.appstoreconnect.apple.com/v1"

    // Lazy Variables
    internal lazy var url: URL = URL(string: path)!
}