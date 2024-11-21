//
//  ParamXlicCompareType.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamXlicCompareType
public class ParamXlicCompareType: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_xliccomparetype(rawValue).hub.wrap() }
        set { icalparameter_set_xliccomparetype(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_xliccomparetype(value.rawValue))
    }
}

extension ParamXlicCompareType {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_xliccomparetype
        public let rawValue: icalparameter_xliccomparetype
        public init(rawValue: icalparameter_xliccomparetype) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
      
    }
}

extension icalparameter_xliccomparetype: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_xliccomparetype {
    
    /// wrap
    /// - Returns: ParamXlicCompareType.Value
    internal func wrap() -> ParamXlicCompareType.Value {
        return .init(rawValue: base)
    }
}
