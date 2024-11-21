//
//  PropPatchTarget.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropPatchTarget
public class PropPatchTarget: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_patchtarget(rawValue).hub.wrap() }
        set { icalproperty_set_patchtarget(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_patchtarget(value))
    }
}
