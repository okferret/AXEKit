//
//  PropScope.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropScope
public class PropScope: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_scope(rawValue).hub.wrap() }
        set { icalproperty_set_scope(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_scope(value))
    }
}
