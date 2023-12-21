//
//  NetworkErrorType.swift
//  GiantBeers
//
//  Created by Yasin Makin on 19.12.23.
//

import Foundation

enum NetworkErrorType: Error {
    case notSerializable
    case informational
    case server
    case redirection
    case client
    case sessionInvalid
    case undefined
    case notValidUrl
    
    static func type(with errorCode: Int) -> Self {
        switch errorCode {
        case 100..<200:
            return .informational
        case 300..<400:
            return .redirection
        case 400..<500:
            return .client
        case 500..<600:
            return .server
        default:
            return .undefined
        }
    }
}
