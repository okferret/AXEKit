//
//  ParamEnable.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamEnable
public class ParamEnable: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_enable(rawValue).hub.wrap() }
        set { icalparameter_set_enable(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_enable(value.rawValue))
    }
}

extension ParamEnable {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_enable
        public let rawValue: icalparameter_enable
        public init(rawValue: icalparameter_enable) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_ENABLE_X
        public static var X: Value { .init(rawValue: ICAL_ENABLE_X) }
        /// ICAL_ENABLE_TRUE
        public static var TRUE: Value { .init(rawValue: ICAL_ENABLE_TRUE) }
        /// ICAL_ENABLE_FALSE
        public static var FALSE: Value { .init(rawValue: ICAL_ENABLE_FALSE) }
        /// ICAL_ENABLE_NONE
        public static var NONE: Value { .init(rawValue: ICAL_ENABLE_NONE) }
    }
}

extension icalparameter_enable: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_enable {
    
    /// wrap
    /// - Returns: ParamEnable.Value
    internal func wrap() -> ParamEnable.Value {
        return .init(rawValue: base)
    }
}
