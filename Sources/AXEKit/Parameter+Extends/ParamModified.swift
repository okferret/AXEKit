//
//  ParamModified.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamModified
public class ParamModified: Parameter {
    
    /// String
    public var value: String {
        get { icalparameter_get_modified(rawValue).hub.wrap() }
        set { icalparameter_set_modified(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalparameter_new_modified(value))
    }
}
