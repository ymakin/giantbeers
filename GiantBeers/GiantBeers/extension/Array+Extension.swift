//
//  Array+Extension.swift
//  GiantBeers
//
//  Created by Yasin Makin on 21.12.23.
//

import SwiftUI

extension Array where Element == Ingredients.MaltItem {
    var stringRepresentation: String {
        self.map { "\($0.name): \($0.amount.value) \($0.amount.unit)" }.joined(separator: ", ")
    }
}

extension Array where Element == Ingredients.HopsItem {
    var stringRepresentation: String {
        self.map { "\($0.name): \($0.amount.value) \($0.amount.unit), \($0.add), \($0.attribute)" }
            .joined(separator: " | ")
    }
}

extension Array where Element == Text {
    func joined(separator: String) -> Text {
        self.enumerated().reduce(Text(""), {
            if $1.offset == 0 {
                return $0 + $1.element
            } else {
                return $0 + Text(separator) + $1.element
            }
        })
    }
}
