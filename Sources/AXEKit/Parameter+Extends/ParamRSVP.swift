//
//  ParamRSVP.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamRSVP
public class ParamRSVP: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_rsvp(rawValue).hub.wrap() }
        set { icalparameter_set_rsvp(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_rsvp(value.rawValue))
    }
}

extension ParamRSVP {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_rsvp
        public let rawValue: icalparameter_rsvp
        public init(rawValue: icalparameter_rsvp) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_RSVP_X
        public static var X: Value { .init(rawValue: ICAL_RSVP_X) }
        /// ICAL_RSVP_TRUE
        public static var TRUE: Value { .init(rawValue: ICAL_RSVP_TRUE) }
        /// ICAL_RSVP_FALSE
        public static var FALSE: Value { .init(rawValue: ICAL_RSVP_FALSE) }
        /// ICAL_RSVP_NONE
        public static var NONE: Value { .init(rawValue: ICAL_RSVP_NONE) }
    }
}

extension icalparameter_rsvp: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_rsvp {
    
    /// wrap
    /// - Returns: ParamRSVP.Value
    internal func wrap() -> ParamRSVP.Value {
        return .init(rawValue: base)
    }
}
