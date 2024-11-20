//
//  Parameter+ScheduleAgent.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_scheduleagent
extension Parameter {
    /// icalparameter_scheduleagent
    public struct ScheduleAgent: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_scheduleagent
        public let rawValue: icalparameter_scheduleagent
        public init(rawValue: icalparameter_scheduleagent) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.ScheduleAgent {
    /// ICAL_SCHEDULEAGENT_X
    public static var X: Parameter.ScheduleAgent { .init(rawValue: ICAL_SCHEDULEAGENT_X) }
    /// ICAL_SCHEDULEAGENT_SERVER
    public static var SERVER: Parameter.ScheduleAgent { .init(rawValue: ICAL_SCHEDULEAGENT_SERVER) }
    /// ICAL_SCHEDULEAGENT_CLIENT
    public static var CLIENT: Parameter.ScheduleAgent { .init(rawValue: ICAL_SCHEDULEAGENT_CLIENT) }
    /// ICAL_SCHEDULEAGENT_NONE
    public static var NONE: Parameter.ScheduleAgent { .init(rawValue: ICAL_SCHEDULEAGENT_NONE) }
}

extension icalparameter_scheduleagent: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_scheduleagent {
    /// wrap
    /// - Returns: Parameter.ScheduleAgent
    internal func wrap() -> Parameter.ScheduleAgent {
        return .init(rawValue: base)
    }
}
