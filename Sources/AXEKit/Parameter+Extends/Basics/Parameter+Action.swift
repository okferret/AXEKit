//
//  Parameter+Action.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_action
extension Parameter {
    /// icalparameter_action
    public struct Action: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_action
        public let rawValue: icalparameter_action
        public init(rawValue: icalparameter_action) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Action {
    /// ICAL_ACTIONPARAM_X
    public static var X: Parameter.Action { .init(rawValue: ICAL_ACTIONPARAM_X) }
    /// ICAL_ACTIONPARAM_ASK
    public static var ASK: Parameter.Action { .init(rawValue: ICAL_ACTIONPARAM_ASK) }
    /// ICAL_ACTIONPARAM_ABORT
    public static var ABORT: Parameter.Action { .init(rawValue: ICAL_ACTIONPARAM_ABORT) }
    /// ICAL_ACTIONPARAM_NONE
    public static var NONE: Parameter.Action { .init(rawValue: ICAL_ACTIONPARAM_NONE) }
}

extension icalparameter_action: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_action {
    /// wrap
    /// - Returns: Parameter.Action
    internal func wrap() -> Parameter.Action {
        return .init(rawValue: base)
    }
}
