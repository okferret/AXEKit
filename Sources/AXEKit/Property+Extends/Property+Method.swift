//
//  Property+Method.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalproperty_method
extension Property {
    /// icalproperty_method
    public struct Method: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_method
        public let rawValue: icalproperty_method
        public init(rawValue: icalproperty_method) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Property.Method {
    /// ICAL_METHOD_X
    public static var X: Property.Method { .init(rawValue: ICAL_METHOD_X) }
    /// ICAL_METHOD_PUBLISH
    public static var PUBLISH: Property.Method { .init(rawValue: ICAL_METHOD_PUBLISH) }
    /// ICAL_METHOD_REQUEST
    public static var REQUEST: Property.Method { .init(rawValue: ICAL_METHOD_REQUEST) }
    /// ICAL_METHOD_REPLY
    public static var REPLY: Property.Method { .init(rawValue: ICAL_METHOD_REPLY) }
    /// ICAL_METHOD_ADD
    public static var ADD: Property.Method { .init(rawValue: ICAL_METHOD_ADD) }
    /// ICAL_METHOD_CANCEL
    public static var CANCEL: Property.Method { .init(rawValue: ICAL_METHOD_CANCEL) }
    /// ICAL_METHOD_REFRESH
    public static var REFRESH: Property.Method { .init(rawValue: ICAL_METHOD_REFRESH) }
    /// ICAL_METHOD_COUNTER
    public static var COUNTER: Property.Method { .init(rawValue: ICAL_METHOD_COUNTER) }
    /// ICAL_METHOD_DECLINECOUNTER
    public static var DECLINECOUNTER: Property.Method { .init(rawValue: ICAL_METHOD_DECLINECOUNTER) }
    /// ICAL_METHOD_CREATE
    public static var CREATE: Property.Method { .init(rawValue: ICAL_METHOD_CREATE) }
    /// ICAL_METHOD_READ
    public static var READ: Property.Method { .init(rawValue: ICAL_METHOD_READ) }
    /// ICAL_METHOD_RESPONSE
    public static var RESPONSE: Property.Method { .init(rawValue: ICAL_METHOD_RESPONSE) }
    /// ICAL_METHOD_MOVE
    public static var MOVE: Property.Method { .init(rawValue: ICAL_METHOD_MOVE) }
    /// ICAL_METHOD_MODIFY
    public static var MODIFY: Property.Method { .init(rawValue: ICAL_METHOD_MODIFY) }
    /// ICAL_METHOD_GENERATEUID
    public static var GENERATEUID: Property.Method { .init(rawValue: ICAL_METHOD_GENERATEUID) }
    /// ICAL_METHOD_DELETE
    public static var DELETE: Property.Method { .init(rawValue: ICAL_METHOD_DELETE) }
    /// ICAL_METHOD_POLLSTATUS
    public static var POLLSTATUS: Property.Method { .init(rawValue: ICAL_METHOD_POLLSTATUS) }
    /// ICAL_METHOD_NONE
    public static var NONE: Property.Method { .init(rawValue: ICAL_METHOD_NONE) }
}

extension icalproperty_method: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_method {
    /// wrap
    /// - Returns: Property.Method
    internal func wrap() -> Property.Method {
        return .init(rawValue: base)
    }
}
