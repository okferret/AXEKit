//
//  Parameter+Substate.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_substate
extension Parameter {
    /// icalparameter_substate
    public struct Substate: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_substate
        public let rawValue: icalparameter_substate
        public init(rawValue: icalparameter_substate) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Substate {
    /// ICAL_SUBSTATE_X
    public static var X: Parameter.Substate { .init(rawValue: ICAL_SUBSTATE_X) }
    /// ICAL_SUBSTATE_OK
    public static var OK: Parameter.Substate { .init(rawValue: ICAL_SUBSTATE_OK) }
    /// ICAL_SUBSTATE_ERROR
    public static var ERROR: Parameter.Substate { .init(rawValue: ICAL_SUBSTATE_ERROR) }
    /// ICAL_SUBSTATE_SUSPENDED
    public static var SUSPENDED: Parameter.Substate { .init(rawValue: ICAL_SUBSTATE_SUSPENDED) }
    /// ICAL_SUBSTATE_NONE
    public static var NONE: Parameter.Substate { .init(rawValue: ICAL_SUBSTATE_NONE) }
}

extension icalparameter_substate: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_substate {
    /// wrap
    /// - Returns: Parameter.Substate
    internal func wrap() -> Parameter.Substate {
        return .init(rawValue: base)
    }
}
