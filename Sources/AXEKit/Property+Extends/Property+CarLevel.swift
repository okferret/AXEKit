//
//  Property+CarLevel.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalproperty_carlevel
extension Property {
    /// icalproperty_carlevel
    public struct CarLevel: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_carlevel
        public let rawValue: icalproperty_carlevel
        public init(rawValue: icalproperty_carlevel) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Property.CarLevel {
    /// ICAL_CARLEVEL_X
    public static var X: Property.CarLevel { .init(rawValue: ICAL_CARLEVEL_X) }
    /// ICAL_CARLEVEL_CARNONE
    public static var CARNONE: Property.CarLevel { .init(rawValue: ICAL_CARLEVEL_CARNONE) }
    /// ICAL_CARLEVEL_CARMIN
    public static var CARMIN: Property.CarLevel { .init(rawValue: ICAL_CARLEVEL_CARMIN) }
    /// ICAL_CARLEVEL_CARFULL1
    public static var CARFULL1: Property.CarLevel { .init(rawValue: ICAL_CARLEVEL_CARFULL1) }
    /// ICAL_CARLEVEL_NONE
    public static var NONE: Property.CarLevel { .init(rawValue: ICAL_CARLEVEL_NONE) }
}

extension icalproperty_carlevel: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_carlevel {
    /// wrap
    /// - Returns: Property.CarLevel
    internal func wrap() -> Property.CarLevel {
        return .init(rawValue: base)
    }
}
