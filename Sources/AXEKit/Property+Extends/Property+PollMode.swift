//
//  Property+PollMode.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// PollMode
    public class PollMode: Property {
        
        /// Value
        public var value: Value {
            get { icalproperty_get_pollmode(rawValue).hub.wrap() }
            set { icalproperty_set_pollmode(rawValue, newValue.rawValue) }
        }
        
        /// 构建
        /// - Parameter value: Value
        public convenience init(_ value: Value) {
            self.init(rawValue: icalproperty_new_pollmode(value.rawValue))
        }
        
    }
}

extension Property.PollMode {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_pollmode
        public let rawValue: icalproperty_pollmode
        public init(rawValue: icalproperty_pollmode) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_POLLMODE_X
        public static var X: Value { .init(rawValue: ICAL_POLLMODE_X) }
        /// ICAL_POLLMODE_BASIC
        public static var BASIC: Value { .init(rawValue: ICAL_POLLMODE_BASIC) }
        /// ICAL_POLLMODE_NONE
        public static var NONE: Value { .init(rawValue: ICAL_POLLMODE_NONE) }
    }
}

extension icalproperty_pollmode: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_pollmode {
    
    /// wrap
    /// - Returns: Property.PollMode.Value
    internal func wrap() -> Property.PollMode.Value {
        return .init(rawValue: base)
    }
}
