//
//  UnsafePointer+Extends.swift
//  AXEKit
//
//  Created by okferret on 2024/11/18.
//

import Foundation

extension UnsafePointer: CompatibleValue {}
extension CompatibleWrapper where Base == UnsafePointer<CChar> {
    
    /// wrap
    /// - Returns: String
    internal func wrap() -> String {
        return .init(cString: base)
    }
}
