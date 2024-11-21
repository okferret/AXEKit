//
//  PropRestriction.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropRestriction
public class PropRestriction: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_restriction(rawValue).hub.wrap() }
        set { icalproperty_set_restriction(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_restriction(value))
    }
}
