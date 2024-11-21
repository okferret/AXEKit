//
//  ParamPartstat.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamPartstat
public class ParamPartstat: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_partstat(rawValue).hub.wrap() }
        set { icalparameter_set_partstat(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_partstat(value.rawValue))
    }
}

extension ParamPartstat {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_partstat
        public let rawValue: icalparameter_partstat
        public init(rawValue: icalparameter_partstat) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_PARTSTAT_X
        public static var X: Value { .init(rawValue: ICAL_PARTSTAT_X) }
        /// ICAL_PARTSTAT_NEEDSACTION
        public static var NEEDSACTION: Value { .init(rawValue: ICAL_PARTSTAT_NEEDSACTION) }
        /// ICAL_PARTSTAT_ACCEPTED
        public static var ACCEPTED: Value { .init(rawValue: ICAL_PARTSTAT_ACCEPTED) }
        /// ICAL_PARTSTAT_DECLINED
        public static var DECLINED: Value { .init(rawValue: ICAL_PARTSTAT_DECLINED) }
        /// ICAL_PARTSTAT_TENTATIVE
        public static var TENTATIVE: Value { .init(rawValue: ICAL_PARTSTAT_TENTATIVE) }
        /// ICAL_PARTSTAT_DELEGATED
        public static var DELEGATED: Value { .init(rawValue: ICAL_PARTSTAT_DELEGATED) }
        /// ICAL_PARTSTAT_COMPLETED
        public static var COMPLETED: Value { .init(rawValue: ICAL_PARTSTAT_COMPLETED) }
        /// ICAL_PARTSTAT_INPROCESS
        public static var INPROCESS: Value { .init(rawValue: ICAL_PARTSTAT_INPROCESS) }
        /// ICAL_PARTSTAT_FAILED
        public static var FAILED: Value { .init(rawValue: ICAL_PARTSTAT_FAILED) }
        /// ICAL_PARTSTAT_NONE
        public static var NONE: Value { .init(rawValue: ICAL_PARTSTAT_NONE) }

    }
}

extension icalparameter_partstat: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_partstat {
    
    /// wrap
    /// - Returns: ParamPartstat.Value
    internal func wrap() -> ParamPartstat.Value {
        return .init(rawValue: base)
    }
}
