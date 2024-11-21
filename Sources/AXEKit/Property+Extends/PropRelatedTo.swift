//
//  PropRelatedTo.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropRelatedTo
public class PropRelatedTo: Property {
    
    /// String
    public var value: String {
        get { icalproperty_get_relatedto(rawValue).hub.wrap() }
        set { icalproperty_set_relatedto(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalproperty_new_relatedto(value))
    }
}
