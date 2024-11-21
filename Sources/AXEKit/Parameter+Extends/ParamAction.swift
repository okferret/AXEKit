//
//  ParamAction.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamAction
public class ParamAction: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_actionparam(rawValue).hub.wrap() }
        set { icalparameter_set_actionparam(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_actionparam(value.rawValue))
    }
}

extension ParamAction {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_action
        public let rawValue: icalparameter_action
        public init(rawValue: icalparameter_action) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_ACTIONPARAM_X
        public static var X: Value { .init(rawValue: ICAL_ACTIONPARAM_X) }
        /// ICAL_ACTIONPARAM_ASK
        public static var ASK: Value { .init(rawValue: ICAL_ACTIONPARAM_ASK) }
        /// ICAL_ACTIONPARAM_ABORT
        public static var ABORT: Value { .init(rawValue: ICAL_ACTIONPARAM_ABORT) }
        /// ICAL_ACTIONPARAM_NONE
        public static var NONE: Value { .init(rawValue: ICAL_ACTIONPARAM_NONE) }
    }
}

extension icalparameter_action: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_action {
    
    /// wrap
    /// - Returns: ParamAction.Value
    internal func wrap() -> ParamAction.Value {
        return .init(rawValue: base)
    }
}
