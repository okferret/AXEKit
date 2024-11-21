//
//  ParamRequired.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamRequired
public class ParamRequired: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_required(rawValue).hub.wrap() }
        set { icalparameter_set_required(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_required(value.rawValue))
    }
}

extension ParamRequired {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_required
        public let rawValue: icalparameter_required
        public init(rawValue: icalparameter_required) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_REQUIRED_X
        public static var X: Value { .init(rawValue: ICAL_REQUIRED_X) }
        /// ICAL_REQUIRED_TRUE
        public static var TRUE: Value { .init(rawValue: ICAL_REQUIRED_TRUE) }
        /// ICAL_REQUIRED_FALSE
        public static var FALSE: Value { .init(rawValue: ICAL_REQUIRED_FALSE) }
        /// ICAL_REQUIRED_NONE
        public static var NONE: Value { .init(rawValue: ICAL_REQUIRED_NONE) }

    }
}

extension icalparameter_required: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_required {
    
    /// wrap
    /// - Returns: ParamRequired.Value
    internal func wrap() -> ParamRequired.Value {
        return .init(rawValue: base)
    }
}
