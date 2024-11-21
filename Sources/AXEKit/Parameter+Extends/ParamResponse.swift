//
//  ParamResponse.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamResponse
public class ParamResponse: Parameter {
    
    /// Int32
    public var value: Int32 {
        get { icalparameter_get_response(rawValue) }
        set { icalparameter_set_response(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: Int32
    public convenience init(_ value: Int32) {
        self.init(rawValue: icalparameter_new_response(value))
    }
}
