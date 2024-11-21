//
//  PropITIPVersion.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropITIPVersion
public class PropITIPVersion: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_itipversion(rawValue).hub.wrap() }
        set { icalproperty_set_itipversion(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_itipversion(value))
    }
}
