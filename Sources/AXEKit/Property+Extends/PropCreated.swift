//
//  PropCreated.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropCreated
public class PropCreated: Property {
    
    /// Date
    public var value: Date {
        get { icalproperty_get_created(rawValue).hub.wrap() }
        set { icalproperty_set_created(rawValue, .hub.from(newValue)) }
    }
    
    /// 构建
    /// - Parameter value: Date
    public convenience init(_ value: Date) {
        self.init(rawValue: icalproperty_new_created(.hub.from(value)))
    }
}
