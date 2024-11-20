//
//  Property+Command.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalproperty_cmd
extension Property {
    /// icalproperty_cmd
    public struct Command: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_cmd
        public let rawValue: icalproperty_cmd
        public init(rawValue: icalproperty_cmd) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Property.Command {
    /// ICAL_CMD_X
    public static var X: Property.Command { .init(rawValue: ICAL_CMD_X) }
    /// ICAL_CMD_ABORT
    public static var ABORT: Property.Command { .init(rawValue: ICAL_CMD_ABORT) }
    /// ICAL_CMD_CONTINUE
    public static var CONTINUE: Property.Command { .init(rawValue: ICAL_CMD_CONTINUE) }
    /// ICAL_CMD_CREATE
    public static var CREATE: Property.Command { .init(rawValue: ICAL_CMD_CREATE) }
    /// ICAL_CMD_DELETE
    public static var DELETE: Property.Command { .init(rawValue: ICAL_CMD_DELETE) }
    /// ICAL_CMD_GENERATEUID
    public static var GENERATEUID: Property.Command { .init(rawValue: ICAL_CMD_GENERATEUID) }
    /// ICAL_CMD_GETCAPABILITY
    public static var GETCAPABILITY: Property.Command { .init(rawValue: ICAL_CMD_GETCAPABILITY) }
    /// ICAL_CMD_IDENTIFY
    public static var IDENTIFY: Property.Command { .init(rawValue: ICAL_CMD_IDENTIFY) }
    /// ICAL_CMD_MODIFY
    public static var MODIFY: Property.Command { .init(rawValue: ICAL_CMD_MODIFY) }
    /// ICAL_CMD_MOVE
    public static var MOVE: Property.Command { .init(rawValue: ICAL_CMD_MOVE) }
    /// ICAL_CMD_REPLY
    public static var REPLY: Property.Command { .init(rawValue: ICAL_CMD_REPLY) }
    /// ICAL_CMD_SEARCH
    public static var SEARCH: Property.Command { .init(rawValue: ICAL_CMD_SEARCH) }
    /// ICAL_CMD_SETLOCALE
    public static var SETLOCALE: Property.Command { .init(rawValue: ICAL_CMD_SETLOCALE) }
    /// ICAL_CMD_NONE
    public static var NONE: Property.Command { .init(rawValue: ICAL_CMD_NONE) }
    
}

extension icalproperty_cmd: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_cmd {
    /// wrap
    /// - Returns: Property.Command
    internal func wrap() -> Property.Command {
        return .init(rawValue: base)
    }
}
