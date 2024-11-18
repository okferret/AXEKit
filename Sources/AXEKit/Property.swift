//
//  Property.swift
//  AXEKit
//
//  Created by okferret on 2024/11/15.
//

import libical
import Foundation

/// Property
public class Property: NSObject {
    
    // MARK: - 公开属性
    
    /// Kind
    public var kind: Kind {
        return .init(rawValue: icalproperty_isa(rawValue))
    }
    /// Array<Parameter>
    public var parameters: Array<Parameter> {
        return Set(Parameter.Kind.allCases).subtracting([.ANY]).reduce([]) { $0 + icalproperty_get_parameters(from: rawValue, kind: $1.rawValue) }.map { .init(rawValue: $0) }
    }
    /// String
    public override var description: String {
        if let newValue = icalproperty_as_ical_string(rawValue) {
            return .init(cString: newValue)
        } else {
            return super.description
        }
    }
    
    // MARK: - 私有属性
    
    /// icalproperty
    private let rawValue: icalproperty
  
    // MARK: - 生命周期
    
    /// 构建
    /// - Parameter rawValue: icalproperty
    internal init(rawValue: icalproperty) {
        self.rawValue = rawValue
        super.init()
    }
    
    /// 构建
    /// - Parameter kind: Kind
    public convenience init(kind: Kind) {
        self.init(rawValue: icalproperty_new(kind.rawValue))
    }
    
    /// 构建
    /// - Parameter property: Property
    public convenience init(property: Property) {
        self.init(rawValue: icalproperty_new_clone(property.rawValue))
    }
    
    deinit {
        icalvalue_free(rawValue)
    }
}

extension Property {
    
    // rfc5545
    /// - Returns: String
    internal func rfc5545() -> String {
        if let value = icalproperty_as_ical_string(rawValue) {
            return .init(cString: value)
        } else {
            return ""
        }
    }
}
