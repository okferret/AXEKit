//
//  PropDue.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropDue
public class PropDue: Property {
    
    /// Date
    public var value: Date {
        get { icalproperty_get_due(rawValue).hub.wrap() }
        set { icalproperty_set_due(rawValue, .hub.from(newValue)) }
    }
    
    /// 构建
    /// - Parameter value: Date
    public convenience init(_ value: Date) {
        self.init(rawValue: icalproperty_new_due(.hub.from(value)))
    }
}
