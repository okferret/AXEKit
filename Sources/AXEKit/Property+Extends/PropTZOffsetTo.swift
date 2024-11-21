//
//  PropZOffsetTo.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropTZOffsetTo
public class PropTZOffsetTo: Property {
    
    /// Int32
    public var value: Int32 {
        get { icalproperty_get_tzoffsetto(rawValue) }
        set { icalproperty_set_tzoffsetto(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: Int32
    public convenience init(_ value: Int32) {
        self.init(rawValue: icalproperty_new_tzoffsetto(value))
    }
}
