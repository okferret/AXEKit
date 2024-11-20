//
//  Property+QueryLevel.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalproperty_querylevel
extension Property {
    /// icalproperty_querylevel
    public struct QueryLevel: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_querylevel
        public let rawValue: icalproperty_querylevel
        public init(rawValue: icalproperty_querylevel) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Property.QueryLevel {
    /// ICAL_QUERYLEVEL_X
    public static var X: Property.QueryLevel { .init(rawValue: ICAL_QUERYLEVEL_X) }
    /// ICAL_QUERYLEVEL_CALQL1
    public static var CALQL1: Property.QueryLevel { .init(rawValue: ICAL_QUERYLEVEL_CALQL1) }
    /// ICAL_QUERYLEVEL_CALQLNONE
    public static var CALQLNONE: Property.QueryLevel { .init(rawValue: ICAL_QUERYLEVEL_CALQLNONE) }
    /// ICAL_QUERYLEVEL_NONE
    public static var NONE: Property.QueryLevel { .init(rawValue: ICAL_QUERYLEVEL_NONE) }
}

extension icalproperty_querylevel: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_querylevel {
    /// wrap
    /// - Returns: Property.QueryLevel
    internal func wrap() -> Property.QueryLevel {
        return .init(rawValue: base)
    }
}
