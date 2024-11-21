//
//  PropMaxDate.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropMaxDate
public class PropMaxDate: Property {
    
    /// Date
    public var value: Date {
        get { icalproperty_get_maxdate(rawValue).hub.wrap() }
        set { icalproperty_set_maxdate(rawValue, .hub.from(newValue)) }
    }
    
    /// 构建
    /// - Parameter value: Date
    public convenience init(_ value: Date) {
        self.init(rawValue: icalproperty_new_maxdate(.hub.from(value)))
    }
}
