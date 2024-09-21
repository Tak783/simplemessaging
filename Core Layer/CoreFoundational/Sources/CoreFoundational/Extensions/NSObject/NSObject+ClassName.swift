//
//  NSObject+ClassName.swift
//
//
//  Created on 21/09/2024.
//

import Foundation

extension NSObject {
    public var className: String {
        return "\(type(of: self))"
    }
    
    public static var className: String {
        return "\(self)"
    }
}

