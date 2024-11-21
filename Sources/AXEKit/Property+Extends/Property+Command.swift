//
//  Property+Command.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Command
    public class Command: Property {
        
        /// Value
        public var value: Value {
            get { icalproperty_get_cmd(rawValue).hub.wrap() }
            set { icalproperty_set_cmd(rawValue, newValue.rawValue) }
        }
        
        /// 构建
        /// - Parameter value: Value
        public convenience init(_ value: Value) {
            self.init(rawValue: icalproperty_new_cmd(value.rawValue))
        }
    }
}

extension Property.Command {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_cmd
        public let rawValue: icalproperty_cmd
        public init(rawValue: icalproperty_cmd) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_CMD_X
        public static var X: Value { .init(rawValue: ICAL_CMD_X) }
        /// ICAL_CMD_ABORT
        public static var ABORT: Value { .init(rawValue: ICAL_CMD_ABORT) }
        /// ICAL_CMD_CONTINUE
        public static var CONTINUE: Value { .init(rawValue: ICAL_CMD_CONTINUE) }
        /// ICAL_CMD_CREATE
        public static var CREATE: Value { .init(rawValue: ICAL_CMD_CREATE) }
        /// ICAL_CMD_DELETE
        public static var DELETE: Value { .init(rawValue: ICAL_CMD_DELETE) }
        /// ICAL_CMD_GENERATEUID
        public static var GENERATEUID: Value { .init(rawValue: ICAL_CMD_GENERATEUID) }
        /// ICAL_CMD_GETCAPABILITY
        public static var GETCAPABILITY: Value { .init(rawValue: ICAL_CMD_GETCAPABILITY) }
        /// ICAL_CMD_IDENTIFY
        public static var IDENTIFY: Value { .init(rawValue: ICAL_CMD_IDENTIFY) }
        /// ICAL_CMD_MODIFY
        public static var MODIFY: Value { .init(rawValue: ICAL_CMD_MODIFY) }
        /// ICAL_CMD_MOVE
        public static var MOVE: Value { .init(rawValue: ICAL_CMD_MOVE) }
        /// ICAL_CMD_REPLY
        public static var REPLY: Value { .init(rawValue: ICAL_CMD_REPLY) }
        /// ICAL_CMD_SEARCH
        public static var SEARCH: Value { .init(rawValue: ICAL_CMD_SEARCH) }
        /// ICAL_CMD_SETLOCALE
        public static var SETLOCALE: Value { .init(rawValue: ICAL_CMD_SETLOCALE) }
        /// ICAL_CMD_NONE
        public static var NONE: Value { .init(rawValue: ICAL_CMD_NONE) }

    }
}

extension icalproperty_cmd: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_cmd {
    
    /// wrap
    /// - Returns: Property.Command.Value
    internal func wrap() -> Property.Command.Value {
        return .init(rawValue: base)
    }
}
