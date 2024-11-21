//
//  PropDefaultCharset.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropDefaultCharset
public class PropDefaultCharset: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_defaultcharset(rawValue).hub.wrap() }
        set { icalproperty_set_defaultcharset(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_defaultcharset(value))
    }
}
