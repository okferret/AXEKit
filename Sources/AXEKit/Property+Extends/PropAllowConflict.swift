//
//  PropAllowConflict.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropAllowConflict
public class PropAllowConflict: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_allowconflict(rawValue).hub.wrap() }
        set { icalproperty_set_allowconflict(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_allowconflict(value))
    }
}
