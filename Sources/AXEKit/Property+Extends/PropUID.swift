//
//  PropUID.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropUID
public class PropUID: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_uid(rawValue).hub.wrap() }
        set { icalproperty_set_uid(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_uid(value))
    }
}
