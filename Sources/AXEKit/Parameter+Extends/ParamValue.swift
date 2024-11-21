//
//  ParamValue.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamValue
public class ParamValue: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_value(rawValue).hub.wrap() }
        set { icalparameter_set_value(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_value(value.rawValue))
    }
}

extension ParamValue {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_value
        public let rawValue: icalparameter_value
        public init(rawValue: icalparameter_value) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_VALUE_X
        public static var X: Value { .init(rawValue: ICAL_VALUE_X) }
        /// ICAL_VALUE_BINARY
        public static var BINARY: Value { .init(rawValue: ICAL_VALUE_BINARY) }
        /// ICAL_VALUE_BOOLEAN
        public static var BOOLEAN: Value { .init(rawValue: ICAL_VALUE_BOOLEAN) }
        /// ICAL_VALUE_DATE
        public static var DATE: Value { .init(rawValue: ICAL_VALUE_DATE) }
        /// ICAL_VALUE_DURATION
        public static var DURATION: Value { .init(rawValue: ICAL_VALUE_DURATION) }
        /// ICAL_VALUE_FLOAT
        public static var FLOAT: Value { .init(rawValue: ICAL_VALUE_FLOAT) }
        /// ICAL_VALUE_INTEGER
        public static var INTEGER: Value { .init(rawValue: ICAL_VALUE_INTEGER) }
        /// ICAL_VALUE_PERIOD
        public static var PERIOD: Value { .init(rawValue: ICAL_VALUE_PERIOD) }
        /// ICAL_VALUE_RECUR
        public static var RECUR: Value { .init(rawValue: ICAL_VALUE_RECUR) }
        /// ICAL_VALUE_TEXT
        public static var TEXT: Value { .init(rawValue: ICAL_VALUE_TEXT) }
        /// ICAL_VALUE_URI
        public static var URI: Value { .init(rawValue: ICAL_VALUE_URI) }
        /// ICAL_VALUE_ERROR
        public static var ERROR: Value { .init(rawValue: ICAL_VALUE_ERROR) }
        /// ICAL_VALUE_DATETIME
        public static var DATETIME: Value { .init(rawValue: ICAL_VALUE_DATETIME) }
        /// ICAL_VALUE_UTCOFFSET
        public static var UTCOFFSET: Value { .init(rawValue: ICAL_VALUE_UTCOFFSET) }
        /// ICAL_VALUE_CALADDRESS
        public static var CALADDRESS: Value { .init(rawValue: ICAL_VALUE_CALADDRESS) }
        /// ICAL_VALUE_NONE
        public static var NONE: Value { .init(rawValue: ICAL_VALUE_NONE) }

    }
}

extension icalparameter_value: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_value {
    
    /// wrap
    /// - Returns: ParamValue.Value
    internal func wrap() -> ParamValue.Value {
        return .init(rawValue: base)
    }
}
