//
//  Property+Status.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Status
    public class Status: Property {
        
        /// Value
        public var value: Value {
            get { icalproperty_get_status(rawValue).hub.wrap() }
            set { icalproperty_set_status(rawValue, newValue.rawValue) }
        }
        
        /// 构建
        /// - Parameter value: Value
        public convenience init(_ value: Value) {
            self.init(rawValue: icalproperty_new_status(value.rawValue))
        }
    }
}

extension Property.Status {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_status
        public let rawValue: icalproperty_status
        public init(rawValue: icalproperty_status) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_STATUS_X
        public static var X: Value { .init(rawValue: ICAL_STATUS_X) }
        /// ICAL_STATUS_TENTATIVE
        public static var TENTATIVE: Value { .init(rawValue: ICAL_STATUS_TENTATIVE) }
        /// ICAL_STATUS_CONFIRMED
        public static var CONFIRMED: Value { .init(rawValue: ICAL_STATUS_CONFIRMED) }
        /// ICAL_STATUS_COMPLETED
        public static var COMPLETED: Value { .init(rawValue: ICAL_STATUS_COMPLETED) }
        /// ICAL_STATUS_NEEDSACTION
        public static var NEEDSACTION: Value { .init(rawValue: ICAL_STATUS_NEEDSACTION) }
        /// ICAL_STATUS_CANCELLED
        public static var CANCELLED: Value { .init(rawValue: ICAL_STATUS_CANCELLED) }
        /// ICAL_STATUS_INPROCESS
        public static var INPROCESS: Value { .init(rawValue: ICAL_STATUS_INPROCESS) }
        /// ICAL_STATUS_DRAFT
        public static var DRAFT: Value { .init(rawValue: ICAL_STATUS_DRAFT) }
        /// ICAL_STATUS_FINAL
        public static var FINAL: Value { .init(rawValue: ICAL_STATUS_FINAL) }
        /// ICAL_STATUS_SUBMITTED
        public static var SUBMITTED: Value { .init(rawValue: ICAL_STATUS_SUBMITTED) }
        /// ICAL_STATUS_PENDING
        public static var PENDING: Value { .init(rawValue: ICAL_STATUS_PENDING) }
        /// ICAL_STATUS_FAILED
        public static var FAILED: Value { .init(rawValue: ICAL_STATUS_FAILED) }
        /// ICAL_STATUS_DELETED
        public static var DELETED: Value { .init(rawValue: ICAL_STATUS_DELETED) }
        /// ICAL_STATUS_NONE
        public static var NONE: Value { .init(rawValue: ICAL_STATUS_NONE) }
    }
}

extension icalproperty_status: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_status {
    
    /// wrap
    /// - Returns: Property.Status.Value
    internal func wrap() -> Property.Status.Value {
        return .init(rawValue: base)
    }
}
