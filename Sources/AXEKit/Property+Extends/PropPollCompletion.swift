//
//  PropPollCompletion.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropPollCompletion
public class PropPollCompletion: Property {
    
    /// Value
    public var value: Value {
        get { icalproperty_get_pollcompletion(rawValue).hub.wrap() }
        set { icalproperty_set_pollcompletion(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalproperty_new_pollcompletion(value.rawValue))
    }
}

extension PropPollCompletion {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_pollcompletion
        public let rawValue: icalproperty_pollcompletion
        public init(rawValue: icalproperty_pollcompletion) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_POLLCOMPLETION_X
        public static var X: Value { .init(rawValue: ICAL_POLLCOMPLETION_X) }
        /// ICAL_POLLCOMPLETION_SERVER
        public static var SERVER: Value { .init(rawValue: ICAL_POLLCOMPLETION_SERVER) }
        /// ICAL_POLLCOMPLETION_SERVERSUBMIT
        public static var SERVERSUBMIT: Value { .init(rawValue: ICAL_POLLCOMPLETION_SERVERSUBMIT) }
        /// ICAL_POLLCOMPLETION_SERVERCHOICE
        public static var SERVERCHOICE: Value { .init(rawValue: ICAL_POLLCOMPLETION_SERVERCHOICE) }
        /// ICAL_POLLCOMPLETION_CLIENT
        public static var CLIENT: Value { .init(rawValue: ICAL_POLLCOMPLETION_CLIENT) }
        /// ICAL_POLLCOMPLETION_NONE
        public static var NONE: Value { .init(rawValue: ICAL_POLLCOMPLETION_NONE) }

    }
}

extension icalproperty_pollcompletion: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_pollcompletion {
    
    /// wrap
    /// - Returns: PropPollCompletion.Value
    internal func wrap() -> PropPollCompletion.Value {
        return .init(rawValue: base)
    }
}
