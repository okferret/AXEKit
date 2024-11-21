//
//  PropQuery.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropQuery
public class PropQuery: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_query(rawValue).hub.wrap() }
        set { icalproperty_set_query(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_query(value))
    }
}
