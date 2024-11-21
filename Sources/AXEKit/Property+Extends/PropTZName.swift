//
//  PropTZName.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropTZName
public class PropTZName: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_tzname(rawValue).hub.wrap() }
        set { icalproperty_set_tzname(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_tzname(value))
    }
}
