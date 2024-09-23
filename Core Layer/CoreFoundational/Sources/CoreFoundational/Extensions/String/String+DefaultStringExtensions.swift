//
//  String+DefaultStringExtensions.swift
//
//
//  Created on 19/03/2023.
//

import Foundation

extension String {
    public static var empty = String.init()
    public static var dash = "-"
    public static var newLine = "\n"
    public static var comma = ","
    public static var dot = "."
    public static var space = " "
    public static var commaAndSpace = ", "
    public static var unknown = "unknown"
    public static var error = "error"
    public static var ok = "Ok"
    public static var standardDefault = "default"
}

extension String {
    public var stringByRemovingWhitespaces: String {
        replacingOccurrences(of: String.space, with: String.empty)
    }
}

extension String {
    public var containsWhitespace: Bool {
        return(self.rangeOfCharacter(from: .whitespacesAndNewlines) != nil)
    }
}

extension String {
    public var containsSpecialChracters: Bool {
        return stringByRemovingWhitespaces.range(of: ".*[^A-Za-z0-9].*", options: .regularExpression) != nil
    }
    
    /// Include only digits, decimal point, and negative sign/
    public func removingSpecialCharactersFromNumber() -> String {
        return self.filter { "0123456789.-".contains($0) }
    }
}
