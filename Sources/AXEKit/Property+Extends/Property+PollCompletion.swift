//
//  Property+PollCompletion.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalproperty_pollcompletion
extension Property {
    /// icalproperty_pollcompletion
    public struct PollCompletion: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_pollcompletion
        public let rawValue: icalproperty_pollcompletion
        public init(rawValue: icalproperty_pollcompletion) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Property.PollCompletion {
    /// ICAL_POLLCOMPLETION_X
    public static var X: Property.PollCompletion { .init(rawValue: ICAL_POLLCOMPLETION_X) }
    /// ICAL_POLLCOMPLETION_SERVER
    public static var SERVER: Property.PollCompletion { .init(rawValue: ICAL_POLLCOMPLETION_SERVER) }
    /// ICAL_POLLCOMPLETION_SERVERSUBMIT
    public static var SERVERSUBMIT: Property.PollCompletion { .init(rawValue: ICAL_POLLCOMPLETION_SERVERSUBMIT) }
    /// ICAL_POLLCOMPLETION_SERVERCHOICE
    public static var SERVERCHOICE: Property.PollCompletion { .init(rawValue: ICAL_POLLCOMPLETION_SERVERCHOICE) }
    /// ICAL_POLLCOMPLETION_CLIENT
    public static var CLIENT: Property.PollCompletion { .init(rawValue: ICAL_POLLCOMPLETION_CLIENT) }
    /// ICAL_POLLCOMPLETION_NONE
    public static var NONE: Property.PollCompletion { .init(rawValue: ICAL_POLLCOMPLETION_NONE) }
}

extension icalproperty_pollcompletion: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_pollcompletion {
    /// wrap
    /// - Returns: Property.PollCompletion
    internal func wrap() -> Property.PollCompletion {
        return .init(rawValue: base)
    }
}

