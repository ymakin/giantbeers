//
//  Optional+Extension.swift
//  GiantBeers
//
//  Created by Yasin Makin on 21.12.23.
//

import Foundation

extension Optional where Wrapped == Float {
    func urlQueryItem(name: String) -> URLQueryItem? {
        if let value = self {
            return URLQueryItem(name: name, value: String(value))
        }
        return nil
    }
}

extension Optional where Wrapped == String {
    func urlQueryItem(name: String) -> URLQueryItem? {
        if let value = self {
            return URLQueryItem(name: name, value: value)
        }
        return nil
    }
}

extension Optional where Wrapped == Date {
    func urlQueryItem(name: String) -> URLQueryItem? {
        if let value = self {
            let formattedDate = CustomDateFormatter.dateFormatter.string(from: value)
            return URLQueryItem(name: name, value: formattedDate)
        }
        return nil
    }
}
