//
//  Property+Action.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalproperty_action
extension Property {
    /// icalproperty_action
    public struct Action: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_action
        public let rawValue: icalproperty_action
        public init(rawValue: icalproperty_action) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Property.Action {
    /// ICAL_ACTION_X
    public static var X: Property.Action { .init(rawValue: ICAL_ACTION_X) }
    /// ICAL_ACTION_AUDIO
    public static var AUDIO: Property.Action { .init(rawValue: ICAL_ACTION_AUDIO) }
    /// ICAL_ACTION_DISPLAY
    public static var DISPLAY: Property.Action { .init(rawValue: ICAL_ACTION_DISPLAY) }
    /// ICAL_ACTION_EMAIL
    public static var EMAIL: Property.Action { .init(rawValue: ICAL_ACTION_EMAIL) }
    /// ICAL_ACTION_PROCEDURE
    public static var PROCEDURE: Property.Action { .init(rawValue: ICAL_ACTION_PROCEDURE) }
    /// ICAL_ACTION_NONE
    public static var NONE: Property.Action { .init(rawValue: ICAL_ACTION_NONE) }
}

extension icalproperty_action: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_action {
    /// wrap
    /// - Returns: Property.Action
    internal func wrap() -> Property.Action {
        return .init(rawValue: base)
    }
}

