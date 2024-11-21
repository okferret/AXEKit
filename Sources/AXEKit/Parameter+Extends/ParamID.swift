//
//  ParamID.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamID
public class ParamID: Parameter {
    
    /// String
    public var value: String {
        get { icalparameter_get_id(rawValue).hub.wrap() }
        set { icalparameter_set_id(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalparameter_new_id(value))
    }
}
