//
//  Parameter.swift
//  AXEKit
//
//  Created by okferret on 2024/11/15.
//

import libical
import Foundation

public class Parameter: NSObject {
    
    // MARK: - 公开属性
    
    /// Kind
    public var kind: Kind {
        return .init(rawValue: icalparameter_isa(rawValue))
    }
    /// String
    public override var description: String {
        if let newText = icalparameter_as_ical_string(rawValue) {
            return .init(cString: newText)
        } else {
            return super.description
        }
    }
    
    // MARK: - 私有属性
    
    /// icalparameter
    private let rawValue: icalparameter
    
    // MARK: - 生命周期
    
    /// 构建
    /// - Parameter rawValue: icalparameter
    internal init(rawValue: icalparameter) {
        self.rawValue = rawValue
        super.init()
    }
    
    /// 构建
    /// - Parameter kind: Kind
    public convenience init(kind: Kind) {
        self.init(rawValue: icalparameter_new(kind.rawValue))
    }
    
    /// 构建
    /// - Parameter parameter: Parameter
    public convenience init(parameter: Parameter) {
        self.init(rawValue: icalparameter_new_clone(parameter.rawValue))
    }
    
    deinit {
        icalparameter_free(rawValue)
    }
}

extension Parameter {
    
    /// rfc5545
    /// - Returns: String
    internal func rfc5545() -> String {
        if let value = icalparameter_as_ical_string(rawValue) {
            return .init(cString: value)
        } else {
            return ""
        }
    }
}
