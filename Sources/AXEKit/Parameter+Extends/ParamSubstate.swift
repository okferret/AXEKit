//
//  ParamSubstate.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamSubstate
public class ParamSubstate: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_substate(rawValue).hub.wrap() }
        set { icalparameter_set_substate(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_substate(value.rawValue))
    }
}

extension ParamSubstate {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_substate
        public let rawValue: icalparameter_substate
        public init(rawValue: icalparameter_substate) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_SUBSTATE_X
        public static var X: Value { .init(rawValue: ICAL_SUBSTATE_X) }
        /// ICAL_SUBSTATE_OK
        public static var OK: Value { .init(rawValue: ICAL_SUBSTATE_OK) }
        /// ICAL_SUBSTATE_ERROR
        public static var ERROR: Value { .init(rawValue: ICAL_SUBSTATE_ERROR) }
        /// ICAL_SUBSTATE_SUSPENDED
        public static var SUSPENDED: Value { .init(rawValue: ICAL_SUBSTATE_SUSPENDED) }
        /// ICAL_SUBSTATE_NONE
        public static var NONE: Value { .init(rawValue: ICAL_SUBSTATE_NONE) }
    }
}

extension icalparameter_substate: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_substate {
    
    /// wrap
    /// - Returns: ParamSubstate.Value
    internal func wrap() -> ParamSubstate.Value {
        return .init(rawValue: base)
    }
}
