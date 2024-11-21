//
//  PropPermission.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropPermission
public class PropPermission: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_permission(rawValue).hub.wrap() }
        set { icalproperty_set_permission(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_permission(value))
    }
}
