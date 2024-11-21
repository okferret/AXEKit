//
//  PropAcknowledged.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropAcknowledged
public class PropAcknowledged: Property {
    
    /// Date
    public var value: Date {
        get { icalproperty_get_acknowledged(rawValue).hub.wrap() }
        set { icalproperty_set_acknowledged(rawValue, .hub.from(newValue)) }
    }
    
    /// 构建
    /// - Parameter value: Date
    public convenience init(_ value: Date) {
        self.init(rawValue: icalproperty_new_acknowledged(.hub.from(value)))
    }
}
