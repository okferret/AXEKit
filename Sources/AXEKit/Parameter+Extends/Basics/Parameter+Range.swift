//
//  Parameter+Range.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_range
extension Parameter {
    /// icalparameter_range
    public struct Range: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_range
        public let rawValue: icalparameter_range
        public init(rawValue: icalparameter_range) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Range {
    /// ICAL_RANGE_X
    public static var X: Parameter.Range { .init(rawValue: ICAL_RANGE_X) }
    /// ICAL_RANGE_THISANDPRIOR
    public static var THISANDPRIOR: Parameter.Range { .init(rawValue: ICAL_RANGE_THISANDPRIOR) }
    /// ICAL_RANGE_THISANDFUTURE
    public static var THISANDFUTURE: Parameter.Range { .init(rawValue: ICAL_RANGE_THISANDFUTURE) }
    /// ICAL_RANGE_NONE
    public static var NONE: Parameter.Range { .init(rawValue: ICAL_RANGE_NONE) }
}

extension icalparameter_range: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_range {
    /// wrap
    /// - Returns: Parameter.Range
    internal func wrap() -> Parameter.Range {
        return .init(rawValue: base)
    }
}
