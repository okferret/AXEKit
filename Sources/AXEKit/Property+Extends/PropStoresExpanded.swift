//
//  PropStoresExpanded.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropStoresExpanded
public class PropStoresExpanded: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_storesexpanded(rawValue).hub.wrap() }
        set { icalproperty_set_storesexpanded(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_storesexpanded(value))
    }
}