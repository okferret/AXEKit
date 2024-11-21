//
//  PropPatchDelete.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropPatchDelete
public class PropPatchDelete: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_patchdelete(rawValue).hub.wrap() }
        set { icalproperty_set_patchdelete(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_patchdelete(value))
    }
}
