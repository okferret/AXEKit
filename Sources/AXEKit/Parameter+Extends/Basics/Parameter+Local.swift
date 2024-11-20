//
//  Parameter+Local.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_local
extension Parameter {
    /// icalparameter_local
    public struct Local: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_local
        public let rawValue: icalparameter_local
        public init(rawValue: icalparameter_local) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Local {
    /// ICAL_LOCAL_X
    public static var X: Parameter.Local { .init(rawValue: ICAL_LOCAL_X) }
    /// ICAL_LOCAL_TRUE
    public static var TRUE: Parameter.Local { .init(rawValue: ICAL_LOCAL_TRUE) }
    /// ICAL_LOCAL_FALSE
    public static var FALSE: Parameter.Local { .init(rawValue: ICAL_LOCAL_FALSE) }
    /// ICAL_LOCAL_NONE
    public static var NONE: Parameter.Local { .init(rawValue: ICAL_LOCAL_NONE) }
}

extension icalparameter_local: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_local {
    /// wrap
    /// - Returns: Parameter.Local
    internal func wrap() -> Parameter.Local {
        return .init(rawValue: base)
    }
}
