//
//  Property+Method.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Method
    public class Method: Property {
        
        /// Value
        public var value: Value {
            get { icalproperty_get_method(rawValue).hub.wrap() }
            set { icalproperty_set_method(rawValue, newValue.rawValue) }
        }
        
        /// 构建
        /// - Parameter value: Value
        public convenience init(_ value: Value) {
            self.init(rawValue: icalproperty_new_method(value.rawValue))
        }
    }
}

extension Property.Method {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_method
        public let rawValue: icalproperty_method
        public init(rawValue: icalproperty_method) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_METHOD_X
        public static var X: Value { .init(rawValue: ICAL_METHOD_X) }
        /// ICAL_METHOD_PUBLISH
        public static var PUBLISH: Value { .init(rawValue: ICAL_METHOD_PUBLISH) }
        /// ICAL_METHOD_REQUEST
        public static var REQUEST: Value { .init(rawValue: ICAL_METHOD_REQUEST) }
        /// ICAL_METHOD_REPLY
        public static var REPLY: Value { .init(rawValue: ICAL_METHOD_REPLY) }
        /// ICAL_METHOD_ADD
        public static var ADD: Value { .init(rawValue: ICAL_METHOD_ADD) }
        /// ICAL_METHOD_CANCEL
        public static var CANCEL: Value { .init(rawValue: ICAL_METHOD_CANCEL) }
        /// ICAL_METHOD_REFRESH
        public static var REFRESH: Value { .init(rawValue: ICAL_METHOD_REFRESH) }
        /// ICAL_METHOD_COUNTER
        public static var COUNTER: Value { .init(rawValue: ICAL_METHOD_COUNTER) }
        /// ICAL_METHOD_DECLINECOUNTER
        public static var DECLINECOUNTER: Value { .init(rawValue: ICAL_METHOD_DECLINECOUNTER) }
        /// ICAL_METHOD_CREATE
        public static var CREATE: Value { .init(rawValue: ICAL_METHOD_CREATE) }
        /// ICAL_METHOD_READ
        public static var READ: Value { .init(rawValue: ICAL_METHOD_READ) }
        /// ICAL_METHOD_RESPONSE
        public static var RESPONSE: Value { .init(rawValue: ICAL_METHOD_RESPONSE) }
        /// ICAL_METHOD_MOVE
        public static var MOVE: Value { .init(rawValue: ICAL_METHOD_MOVE) }
        /// ICAL_METHOD_MODIFY
        public static var MODIFY: Value { .init(rawValue: ICAL_METHOD_MODIFY) }
        /// ICAL_METHOD_GENERATEUID
        public static var GENERATEUID: Value { .init(rawValue: ICAL_METHOD_GENERATEUID) }
        /// ICAL_METHOD_DELETE
        public static var DELETE: Value { .init(rawValue: ICAL_METHOD_DELETE) }
        /// ICAL_METHOD_POLLSTATUS
        public static var POLLSTATUS: Value { .init(rawValue: ICAL_METHOD_POLLSTATUS) }
        /// ICAL_METHOD_NONE
        public static var NONE: Value { .init(rawValue: ICAL_METHOD_NONE) }

    }
}

extension icalproperty_method: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_method {
    
    /// wrap
    /// - Returns: Property.Method.Value
    internal func wrap() -> Property.Method.Value {
        return .init(rawValue: base)
    }
}
