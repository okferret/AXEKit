//
//  PropVersion.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropVersion
public class PropVersion: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_version(rawValue).hub.wrap() }
        set { icalproperty_set_version(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_version(value))
    }
}
