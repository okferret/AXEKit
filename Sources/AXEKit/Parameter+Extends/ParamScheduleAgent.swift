//
//  ParamScheduleAgent.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamScheduleAgent
public class ParamScheduleAgent: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_scheduleagent(rawValue).hub.wrap() }
        set { icalparameter_set_scheduleagent(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_scheduleagent(value.rawValue))
    }
}

extension ParamScheduleAgent {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_scheduleagent
        public let rawValue: icalparameter_scheduleagent
        public init(rawValue: icalparameter_scheduleagent) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_SCHEDULEAGENT_X
        public static var X: Value { .init(rawValue: ICAL_SCHEDULEAGENT_X) }
        /// ICAL_SCHEDULEAGENT_SERVER
        public static var SERVER: Value { .init(rawValue: ICAL_SCHEDULEAGENT_SERVER) }
        /// ICAL_SCHEDULEAGENT_CLIENT
        public static var CLIENT: Value { .init(rawValue: ICAL_SCHEDULEAGENT_CLIENT) }
        /// ICAL_SCHEDULEAGENT_NONE
        public static var NONE: Value { .init(rawValue: ICAL_SCHEDULEAGENT_NONE) }
    }
}

extension icalparameter_scheduleagent: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_scheduleagent {
    
    /// wrap
    /// - Returns: ParamScheduleAgent.Value
    internal func wrap() -> ParamScheduleAgent.Value {
        return .init(rawValue: base)
    }
}
