//
//  Property+BusyType.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalproperty_busytype
extension Property {
    /// icalproperty_busytype
    public struct BusyType: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_busytype
        public let rawValue: icalproperty_busytype
        public init(rawValue: icalproperty_busytype) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Property.BusyType {
    /// ICAL_BUSYTYPE_X
    public static var X: Property.BusyType { .init(rawValue: ICAL_BUSYTYPE_X) }
    /// ICAL_BUSYTYPE_BUSY
    public static var BUSY: Property.BusyType { .init(rawValue: ICAL_BUSYTYPE_BUSY) }
    /// ICAL_BUSYTYPE_BUSYUNAVAILABLE
    public static var BUSYUNAVAILABLE: Property.BusyType { .init(rawValue: ICAL_BUSYTYPE_BUSYUNAVAILABLE) }
    /// ICAL_BUSYTYPE_BUSYTENTATIVE
    public static var BUSYTENTATIVE: Property.BusyType { .init(rawValue: ICAL_BUSYTYPE_BUSYTENTATIVE) }
    /// ICAL_BUSYTYPE_NONE
    public static var NONE: Property.BusyType { .init(rawValue: ICAL_BUSYTYPE_NONE) }
}

extension icalproperty_busytype: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_busytype {
    /// wrap
    /// - Returns: Property.BusyType
    internal func wrap() -> Property.BusyType {
        return .init(rawValue: base)
    }
}
