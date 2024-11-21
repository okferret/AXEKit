//
//  PropAction.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropAction
public class PropAction: Property {
    
    /// Value
    public var value: Value {
        get { icalproperty_get_action(rawValue).hub.wrap() }
        set { icalproperty_set_action(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalproperty_new_action(value.rawValue))
    }
}

extension PropAction {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_action
        public let rawValue: icalproperty_action
        public init(rawValue: icalproperty_action) {
            self.rawValue = rawValue
        }
        /// hash
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_ACTION_X
        public static var X: Value { .init(rawValue: ICAL_ACTION_X) }
        /// ICAL_ACTION_AUDIO
        public static var AUDIO: Value { .init(rawValue: ICAL_ACTION_AUDIO) }
        /// ICAL_ACTION_DISPLAY
        public static var DISPLAY: Value { .init(rawValue: ICAL_ACTION_DISPLAY) }
        /// ICAL_ACTION_EMAIL
        public static var EMAIL: Value { .init(rawValue: ICAL_ACTION_EMAIL) }
        /// ICAL_ACTION_PROCEDURE
        public static var PROCEDURE: Value { .init(rawValue: ICAL_ACTION_PROCEDURE) }
        /// ICAL_ACTION_NONE
        public static var NONE: Value { .init(rawValue: ICAL_ACTION_NONE) }
    }
}

extension icalproperty_action: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_action {
    
    /// wrap
    /// - Returns: PropAction.Value
    internal func wrap() -> PropAction.Value {
        return .init(rawValue: base)
    }
}
