//
//  PropEstimatedDuration.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropEstimatedDuration
public class PropEstimatedDuration: Property {
    
    /// icaldurationtype
    public var value: icaldurationtype {
        get { icalproperty_get_estimatedduration(rawValue) }
        set { icalproperty_set_estimatedduration(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: icaldurationtype
    public convenience init(_ value: icaldurationtype) {
        self.init(rawValue: icalproperty_new_estimatedduration(value))
    }
}
