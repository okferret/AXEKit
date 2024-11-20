//
//  Parameter+Value.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_value
extension Parameter {
    /// icalparameter_value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_value
        public let rawValue: icalparameter_value
        public init(rawValue: icalparameter_value) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Value {
    /// ICAL_VALUE_X
    public static var X: Parameter.Value { .init(rawValue: ICAL_VALUE_X) }
    /// ICAL_VALUE_BINARY
    public static var BINARY: Parameter.Value { .init(rawValue: ICAL_VALUE_BINARY) }
    /// ICAL_VALUE_BOOLEAN
    public static var BOOLEAN: Parameter.Value { .init(rawValue: ICAL_VALUE_BOOLEAN) }
    /// ICAL_VALUE_DATE
    public static var DATE: Parameter.Value { .init(rawValue: ICAL_VALUE_DATE) }
    /// ICAL_VALUE_DURATION
    public static var DURATION: Parameter.Value { .init(rawValue: ICAL_VALUE_DURATION) }
    /// ICAL_VALUE_FLOAT
    public static var FLOAT: Parameter.Value { .init(rawValue: ICAL_VALUE_FLOAT) }
    /// ICAL_VALUE_INTEGER
    public static var INTEGER: Parameter.Value { .init(rawValue: ICAL_VALUE_INTEGER) }
    /// ICAL_VALUE_PERIOD
    public static var PERIOD: Parameter.Value { .init(rawValue: ICAL_VALUE_PERIOD) }
    /// ICAL_VALUE_RECUR
    public static var RECUR: Parameter.Value { .init(rawValue: ICAL_VALUE_RECUR) }
    /// ICAL_VALUE_TEXT
    public static var TEXT: Parameter.Value { .init(rawValue: ICAL_VALUE_TEXT) }
    /// ICAL_VALUE_URI
    public static var URI: Parameter.Value { .init(rawValue: ICAL_VALUE_URI) }
    /// ICAL_VALUE_ERROR
    public static var ERROR: Parameter.Value { .init(rawValue: ICAL_VALUE_ERROR) }
    /// ICAL_VALUE_DATETIME
    public static var DATETIME: Parameter.Value { .init(rawValue: ICAL_VALUE_DATETIME) }
    /// ICAL_VALUE_UTCOFFSET
    public static var UTCOFFSET: Parameter.Value { .init(rawValue: ICAL_VALUE_UTCOFFSET) }
    /// ICAL_VALUE_CALADDRESS
    public static var CALADDRESS: Parameter.Value { .init(rawValue: ICAL_VALUE_CALADDRESS) }
    /// ICAL_VALUE_NONE
    public static var NONE: Parameter.Value { .init(rawValue: ICAL_VALUE_NONE) }
}

extension icalparameter_value: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_value {
    /// wrap
    /// - Returns: Parameter.Value
    internal func wrap() -> Parameter.Value {
        return .init(rawValue: base)
    }
}
