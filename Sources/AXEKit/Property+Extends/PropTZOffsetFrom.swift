//
//  PropTZOffsetFrom.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropTZOffsetFrom
public class PropTZOffsetFrom: Property {
    
    /// Int32
    public var value: Int32 {
        get { icalproperty_get_tzoffsetfrom(rawValue) }
        set { icalproperty_set_tzoffsetfrom(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: Int32
    public convenience init(_ value: Int32) {
        self.init(rawValue: icalproperty_new_tzoffsetfrom(value))
    }
}
