//
//  PropExDate.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropExDate
public class PropExDate: Property {
    
    /// Date
    public var value: Date {
        get { icalproperty_get_exdate(rawValue).hub.wrap() }
        set { icalproperty_set_exdate(rawValue, .hub.from(newValue)) }
    }
    
    /// 构建
    /// - Parameter value: Date
    public convenience init(_ value: Date) {
        self.init(rawValue: icalproperty_new_exdate(.hub.from(value)))
    }
}
