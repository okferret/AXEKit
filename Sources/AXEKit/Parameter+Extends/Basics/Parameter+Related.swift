//
//  Parameter+Related.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_related
extension Parameter {
    /// icalparameter_related
    public struct Related: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_related
        public let rawValue: icalparameter_related
        public init(rawValue: icalparameter_related) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Related {
    /// ICAL_RELATED_X
    public static var X: Parameter.Related { .init(rawValue: ICAL_RELATED_X) }
    /// ICAL_RELATED_START
    public static var START: Parameter.Related { .init(rawValue: ICAL_RELATED_START) }
    /// ICAL_RELATED_END
    public static var END: Parameter.Related { .init(rawValue: ICAL_RELATED_END) }
    /// ICAL_RELATED_NONE
    public static var NONE: Parameter.Related { .init(rawValue: ICAL_RELATED_NONE) }
}

extension icalparameter_related: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_related {
    /// wrap
    /// - Returns: Parameter.Related
    internal func wrap() -> Parameter.Related {
        return .init(rawValue: base)
    }
}
