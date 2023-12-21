//
//  CustomDateFormatter.swift
//  GiantBeers
//
//  Created by Yasin Makin on 20.12.23.
//

import Foundation

class CustomDateFormatter {
    public static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale.preferredLocale
        formatter.dateFormat = "mm-yyyy"
        return formatter
    }()
}


extension Locale {
    static var preferredLocale: Locale {
        if let preferredIdentifier = Locale.preferredLanguages.first {
            return Locale(identifier: preferredIdentifier)
        }
        return Locale.current
    }
}
