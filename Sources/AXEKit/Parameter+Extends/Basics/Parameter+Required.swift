//
//  Parameter+Required.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_required
extension Parameter {
    /// icalparameter_required
    public struct Required: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_required
        public let rawValue: icalparameter_required
        public init(rawValue: icalparameter_required) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Required {
    /// ICAL_REQUIRED_X
    public static var X: Parameter.Required { .init(rawValue: ICAL_REQUIRED_X) }
    /// ICAL_REQUIRED_TRUE
    public static var TRUE: Parameter.Required { .init(rawValue: ICAL_REQUIRED_TRUE) }
    /// ICAL_REQUIRED_FALSE
    public static var FALSE: Parameter.Required { .init(rawValue: ICAL_REQUIRED_FALSE) }
    /// ICAL_REQUIRED_NONE
    public static var NONE: Parameter.Required { .init(rawValue: ICAL_REQUIRED_NONE) }
}

extension icalparameter_required: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_required {
    /// wrap
    /// - Returns: Parameter.Required
    internal func wrap() -> Parameter.Required {
        return .init(rawValue: base)
    }
}
