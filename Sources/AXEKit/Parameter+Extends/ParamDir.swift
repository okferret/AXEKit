//
//  ParamDir.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamDir
public class ParamDir: Parameter {
    
    /// String
    public var value: String {
        get { icalparameter_get_dir(rawValue).hub.wrap() }
        set { icalparameter_set_dir(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalparameter_new_dir(value))
    }
}
