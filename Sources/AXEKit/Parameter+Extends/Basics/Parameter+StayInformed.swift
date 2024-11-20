//
//  Parameter+StayInformed.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_stayinformed
extension Parameter {
    /// icalparameter_stayinformed
    public struct StayInformed: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_stayinformed
        public let rawValue: icalparameter_stayinformed
        public init(rawValue: icalparameter_stayinformed) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.StayInformed {
    /// ICAL_STAYINFORMED_X
    public static var X: Parameter.StayInformed { .init(rawValue: ICAL_STAYINFORMED_X) }
    /// ICAL_STAYINFORMED_TRUE
    public static var TRUE: Parameter.StayInformed { .init(rawValue: ICAL_STAYINFORMED_TRUE) }
    /// ICAL_STAYINFORMED_FALSE
    public static var FALSE: Parameter.StayInformed { .init(rawValue: ICAL_STAYINFORMED_FALSE) }
    /// ICAL_STAYINFORMED_NONE
    public static var NONE: Parameter.StayInformed { .init(rawValue: ICAL_STAYINFORMED_NONE) }
}

extension icalparameter_stayinformed: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_stayinformed {
    /// wrap
    /// - Returns: Parameter.StayInformed
    internal func wrap() -> Parameter.StayInformed {
        return .init(rawValue: base)
    }
}
