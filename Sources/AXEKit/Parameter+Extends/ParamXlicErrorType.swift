//
//  ParamXlicErrorType.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamXlicErrorType
public class ParamXlicErrorType: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_xlicerrortype(rawValue).hub.wrap() }
        set { icalparameter_set_xlicerrortype(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_xlicerrortype(value.rawValue))
    }
}

extension ParamXlicErrorType {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_xlicerrortype
        public let rawValue: icalparameter_xlicerrortype
        public init(rawValue: icalparameter_xlicerrortype) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        
    }
}

extension icalparameter_xlicerrortype: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_xlicerrortype {
    
    /// wrap
    /// - Returns: ParamXlicErrorType.Value
    internal func wrap() -> ParamXlicErrorType.Value {
        return .init(rawValue: base)
    }
}
