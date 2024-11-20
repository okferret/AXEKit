//
//  Parameter+ScheduleForceSend.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_scheduleforcesend
extension Parameter {
    /// icalparameter_scheduleforcesend
    public struct ScheduleForceSend: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_scheduleforcesend
        public let rawValue: icalparameter_scheduleforcesend
        public init(rawValue: icalparameter_scheduleforcesend) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.ScheduleForceSend {
    /// ICAL_SCHEDULEFORCESEND_X
    public static var X: Parameter.ScheduleForceSend { .init(rawValue: ICAL_SCHEDULEFORCESEND_X) }
    /// ICAL_SCHEDULEFORCESEND_REQUEST
    public static var REQUEST: Parameter.ScheduleForceSend { .init(rawValue: ICAL_SCHEDULEFORCESEND_REQUEST) }
    /// ICAL_SCHEDULEFORCESEND_REPLY
    public static var REPLY: Parameter.ScheduleForceSend { .init(rawValue: ICAL_SCHEDULEFORCESEND_REPLY) }
    /// ICAL_SCHEDULEFORCESEND_NONE
    public static var NONE: Parameter.ScheduleForceSend { .init(rawValue: ICAL_SCHEDULEFORCESEND_NONE) }
}

extension icalparameter_scheduleforcesend: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_scheduleforcesend {
    /// wrap
    /// - Returns: Parameter.ScheduleForceSend
    internal func wrap() -> Parameter.ScheduleForceSend {
        return .init(rawValue: base)
    }
}
