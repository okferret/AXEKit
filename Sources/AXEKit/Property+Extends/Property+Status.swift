//
//  Property+Status.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalproperty_status
extension Property {
    /// icalproperty_status
    public struct Status: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_status
        public let rawValue: icalproperty_status
        public init(rawValue: icalproperty_status) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Property.Status {
    /// ICAL_STATUS_X
    public static var X: Property.Status { .init(rawValue: ICAL_STATUS_X) }
    /// ICAL_STATUS_TENTATIVE
    public static var TENTATIVE: Property.Status { .init(rawValue: ICAL_STATUS_TENTATIVE) }
    /// ICAL_STATUS_CONFIRMED
    public static var CONFIRMED: Property.Status { .init(rawValue: ICAL_STATUS_CONFIRMED) }
    /// ICAL_STATUS_COMPLETED
    public static var COMPLETED: Property.Status { .init(rawValue: ICAL_STATUS_COMPLETED) }
    /// ICAL_STATUS_NEEDSACTION
    public static var NEEDSACTION: Property.Status { .init(rawValue: ICAL_STATUS_NEEDSACTION) }
    /// ICAL_STATUS_CANCELLED
    public static var CANCELLED: Property.Status { .init(rawValue: ICAL_STATUS_CANCELLED) }
    /// ICAL_STATUS_INPROCESS
    public static var INPROCESS: Property.Status { .init(rawValue: ICAL_STATUS_INPROCESS) }
    /// ICAL_STATUS_DRAFT
    public static var DRAFT: Property.Status { .init(rawValue: ICAL_STATUS_DRAFT) }
    /// ICAL_STATUS_FINAL
    public static var FINAL: Property.Status { .init(rawValue: ICAL_STATUS_FINAL) }
    /// ICAL_STATUS_SUBMITTED
    public static var SUBMITTED: Property.Status { .init(rawValue: ICAL_STATUS_SUBMITTED) }
    /// ICAL_STATUS_PENDING
    public static var PENDING: Property.Status { .init(rawValue: ICAL_STATUS_PENDING) }
    /// ICAL_STATUS_FAILED
    public static var FAILED: Property.Status { .init(rawValue: ICAL_STATUS_FAILED) }
    /// ICAL_STATUS_DELETED
    public static var DELETED: Property.Status { .init(rawValue: ICAL_STATUS_DELETED) }
    /// ICAL_STATUS_NONE
    public static var NONE: Property.Status { .init(rawValue: ICAL_STATUS_NONE) }
}

extension icalproperty_status: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_status {
    /// wrap
    /// - Returns: Property.Status
    internal func wrap() -> Property.Status {
        return .init(rawValue: base)
    }
}
