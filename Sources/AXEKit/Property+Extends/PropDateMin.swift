//
//  PropDateMin.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropDateMin
public class PropDateMin: Property {
    
    /// Date
    public var value: Date {
        get { icalproperty_get_datemin(rawValue).hub.wrap() }
        set { icalproperty_set_datemin(rawValue, .hub.from(newValue)) }
    }
    
    /// 构建
    /// - Parameter value: Date
    public convenience init(_ value: Date) {
        self.init(rawValue: icalproperty_new_datemin(.hub.from(value)))
    }
}
