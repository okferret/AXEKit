//
//  Value.swift
//  AXEKit
//
//  Created by okferret on 2024/11/15.
//

import Foundation
import libical

/// Value
public class Value: NSObject {
    
    // MARK: - 公开属性
    
    /// Kind
    public var kind: Kind {
        return .init(rawValue: icalvalue_isa(rawValue))
    }
    /// String
    public override var description: String {
        if let newValue = icalvalue_as_ical_string(rawValue) {
            return .init(cString: newValue)
        } else {
            return super.description
        }
    }
    
    // MARK: - 私有属性
    
    /// icalvalue
    internal let rawValue: icalvalue
    
    // MARK: - 生命周期
    
    /// 构建
    /// - Parameter rawValue: icalvalue
    internal init(rawValue: icalvalue) {
        self.rawValue = rawValue
        super.init()
    }
    
    /// 构建
    /// - Parameter kind: Kind
    public convenience init(kind: Kind) {
        self.init(rawValue: icalvalue_new(kind.rawValue))
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(value: Value) {
        self.init(rawValue: icalvalue_new_clone(value.rawValue))
    }
    
    deinit {
        icalvalue_free(rawValue)
    }
}

extension Value {
    
    // rfc5545
    /// - Returns: String
    internal func rfc5545() -> String {
        if let value = icalvalue_as_ical_string(rawValue) {
            return .init(cString: value)
        } else {
            return ""
        }
    }

}
