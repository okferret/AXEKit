//
//  ParamLocal.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamLocal
public class ParamLocal: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_local(rawValue).hub.wrap() }
        set { icalparameter_set_local(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_local(value.rawValue))
    }
}

extension ParamLocal {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_local
        public let rawValue: icalparameter_local
        public init(rawValue: icalparameter_local) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_LOCAL_X
        public static var X: Value { .init(rawValue: ICAL_LOCAL_X) }
        /// ICAL_LOCAL_TRUE
        public static var TRUE: Value { .init(rawValue: ICAL_LOCAL_TRUE) }
        /// ICAL_LOCAL_FALSE
        public static var FALSE: Value { .init(rawValue: ICAL_LOCAL_FALSE) }
        /// ICAL_LOCAL_NONE
        public static var NONE: Value { .init(rawValue: ICAL_LOCAL_NONE) }
    }
}

extension icalparameter_local: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_local {
    
    /// wrap
    /// - Returns: ParamLocal.Value
    internal func wrap() -> ParamLocal.Value {
        return .init(rawValue: base)
    }
}
