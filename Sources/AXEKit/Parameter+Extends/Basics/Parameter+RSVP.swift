//
//  Parameter+RSVP.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_rsvp
extension Parameter {
    /// icalparameter_rsvp
    public struct RSVP: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_rsvp
        public let rawValue: icalparameter_rsvp
        public init(rawValue: icalparameter_rsvp) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.RSVP {
    /// ICAL_RSVP_X
    public static var X: Parameter.RSVP { .init(rawValue: ICAL_RSVP_X) }
    /// ICAL_RSVP_TRUE
    public static var TRUE: Parameter.RSVP { .init(rawValue: ICAL_RSVP_TRUE) }
    /// ICAL_RSVP_FALSE
    public static var FALSE: Parameter.RSVP { .init(rawValue: ICAL_RSVP_FALSE) }
    /// ICAL_RSVP_NONE
    public static var NONE: Parameter.RSVP { .init(rawValue: ICAL_RSVP_NONE) }
}

extension icalparameter_rsvp: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_rsvp {
    /// wrap
    /// - Returns: Parameter.RSVP
    internal func wrap() -> Parameter.RSVP {
        return .init(rawValue: base)
    }
}

