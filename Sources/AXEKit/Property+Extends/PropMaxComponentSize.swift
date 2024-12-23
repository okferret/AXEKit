//
//  PropMaxComponentSize.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropMaxComponentSize
public class PropMaxComponentSize: Property {
    
    /// Int32
    public var value: Int32 {
        get { icalproperty_get_maxcomponentsize(rawValue) }
        set { icalproperty_set_maxcomponentsize(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: Int32
    public convenience init(_ value: Int32) {
        self.init(rawValue: icalproperty_new_maxcomponentsize(value))
    }
}
