//
//  PropTZID.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropTZID
public class PropTZID: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_tzid(rawValue).hub.wrap() }
        set { icalproperty_set_tzid(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_tzid(value))
    }
}
