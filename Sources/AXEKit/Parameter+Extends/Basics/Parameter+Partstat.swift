//
//  Parameter+Partstat.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - Wrap<icalparameter_partstat>
extension Parameter {
    /// icalparameter_local
    public struct Partstat: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_partstat
        public let rawValue: icalparameter_partstat
        public init(rawValue: icalparameter_partstat) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Partstat {
    /// ICAL_PARTSTAT_X
    public static var X: Parameter.Partstat { .init(rawValue: ICAL_PARTSTAT_X) }
    /// ICAL_PARTSTAT_NEEDSACTION
    public static var NEEDSACTION: Parameter.Partstat { .init(rawValue: ICAL_PARTSTAT_NEEDSACTION) }
    /// ICAL_PARTSTAT_ACCEPTED
    public static var ACCEPTED: Parameter.Partstat { .init(rawValue: ICAL_PARTSTAT_ACCEPTED) }
    /// ICAL_PARTSTAT_DECLINED
    public static var DECLINED: Parameter.Partstat { .init(rawValue: ICAL_PARTSTAT_DECLINED) }
    /// ICAL_PARTSTAT_TENTATIVE
    public static var TENTATIVE: Parameter.Partstat { .init(rawValue: ICAL_PARTSTAT_TENTATIVE) }
    /// ICAL_PARTSTAT_DELEGATED
    public static var DELEGATED: Parameter.Partstat { .init(rawValue: ICAL_PARTSTAT_DELEGATED) }
    /// ICAL_PARTSTAT_COMPLETED
    public static var COMPLETED: Parameter.Partstat { .init(rawValue: ICAL_PARTSTAT_COMPLETED) }
    /// ICAL_PARTSTAT_INPROCESS
    public static var INPROCESS: Parameter.Partstat { .init(rawValue: ICAL_PARTSTAT_INPROCESS) }
    /// ICAL_PARTSTAT_FAILED
    public static var FAILED: Parameter.Partstat { .init(rawValue: ICAL_PARTSTAT_FAILED) }
    /// ICAL_PARTSTAT_NONE
    public static var NONE: Parameter.Partstat { .init(rawValue: ICAL_PARTSTAT_NONE) }
}

extension icalparameter_partstat: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_partstat {
    /// wrap
    /// - Returns: Parameter.Partstat
    internal func wrap() -> Parameter.Partstat {
        return .init(rawValue: base)
    }
}
