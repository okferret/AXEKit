//
//  ParamLanguage.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamLanguage
public class ParamLanguage: Parameter {
    
    /// String
    public var value: String {
        get { icalparameter_get_language(rawValue).hub.wrap() }
        set { icalparameter_set_language(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: String
    public convenience init(_ value: String) {
        self.init(rawValue: icalparameter_new_language(value))
    }
}
