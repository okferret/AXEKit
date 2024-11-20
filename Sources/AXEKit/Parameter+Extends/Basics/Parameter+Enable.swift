//
//  Parameter+Enable.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_enable
extension Parameter {
    /// icalparameter_enable
    public struct Enable: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_enable
        public let rawValue: icalparameter_enable
        public init(rawValue: icalparameter_enable) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Enable {
    /// ICAL_ENABLE_X
    public static var X: Parameter.Enable { .init(rawValue: ICAL_ENABLE_X) }
    /// ICAL_ENABLE_TRUE
    public static var TRUE: Parameter.Enable { .init(rawValue: ICAL_ENABLE_TRUE) }
    /// ICAL_ENABLE_FALSE
    public static var FALSE: Parameter.Enable { .init(rawValue: ICAL_ENABLE_FALSE) }
    /// ICAL_ENABLE_NONE
    public static var NONE: Parameter.Enable { .init(rawValue: ICAL_ENABLE_NONE) }
}

extension icalparameter_enable: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_enable {
    /// wrap
    /// - Returns: Parameter.Enable
    internal func wrap() -> Parameter.Enable {
        return .init(rawValue: base)
    }
}
