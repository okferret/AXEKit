//
//  Property+TaskMode.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalproperty_taskmode
extension Property {
    /// icalproperty_taskmode
    public struct TaskMode: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_taskmode
        public let rawValue: icalproperty_taskmode
        public init(rawValue: icalproperty_taskmode) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Property.TaskMode {
    /// ICAL_TASKMODE_X
    public static var X: Property.TaskMode { .init(rawValue: ICAL_TASKMODE_X) }
    /// ICAL_TASKMODE_AUTOMATICCOMPLETION
    public static var AUTOMATICCOMPLETION: Property.TaskMode { .init(rawValue: ICAL_TASKMODE_AUTOMATICCOMPLETION) }
    /// ICAL_TASKMODE_AUTOMATICFAILURE
    public static var AUTOMATICFAILURE: Property.TaskMode { .init(rawValue: ICAL_TASKMODE_AUTOMATICFAILURE) }
    /// ICAL_TASKMODE_AUTOMATICSTATUS
    public static var AUTOMATICSTATUS: Property.TaskMode { .init(rawValue: ICAL_TASKMODE_AUTOMATICSTATUS) }
    /// ICAL_TASKMODE_NONE
    public static var NONE: Property.TaskMode { .init(rawValue: ICAL_TASKMODE_NONE) }
}

extension icalproperty_taskmode: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_taskmode {
    /// wrap
    /// - Returns: Property.TaskMode
    internal func wrap() -> Property.TaskMode {
        return .init(rawValue: base)
    }
}

