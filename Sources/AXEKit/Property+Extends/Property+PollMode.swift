//
//  Property+PollMode.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalproperty_pollmode
extension Property {
    /// icalproperty_pollmode
    public struct PollMode: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_pollmode
        public let rawValue: icalproperty_pollmode
        public init(rawValue: icalproperty_pollmode) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Property.PollMode {
    /// ICAL_POLLMODE_X
    public static var X: Property.PollMode { .init(rawValue: ICAL_POLLMODE_X) }
    /// ICAL_POLLMODE_BASIC
    public static var BASIC: Property.PollMode { .init(rawValue: ICAL_POLLMODE_BASIC) }
    /// ICAL_POLLMODE_NONE
    public static var NONE: Property.PollMode { .init(rawValue: ICAL_POLLMODE_NONE) }
}

extension icalproperty_pollmode: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_pollmode {
    /// wrap
    /// - Returns: Property.PollMode
    internal func wrap() -> Property.PollMode {
        return .init(rawValue: base)
    }
}
