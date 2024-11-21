//
//  PropTaskMode.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropTaskMode
public class PropTaskMode: Property {
    
    /// Value
    public var value: Value {
        get { icalproperty_get_taskmode(rawValue).hub.wrap() }
        set { icalproperty_set_taskmode(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalproperty_new_taskmode(value.rawValue))
    }
}

extension PropTaskMode {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_taskmode
        public let rawValue: icalproperty_taskmode
        public init(rawValue: icalproperty_taskmode) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_TASKMODE_X
        public static var X: Value { .init(rawValue: ICAL_TASKMODE_X) }
        /// ICAL_TASKMODE_AUTOMATICCOMPLETION
        public static var AUTOMATICCOMPLETION: Value { .init(rawValue: ICAL_TASKMODE_AUTOMATICCOMPLETION) }
        /// ICAL_TASKMODE_AUTOMATICFAILURE
        public static var AUTOMATICFAILURE: Value { .init(rawValue: ICAL_TASKMODE_AUTOMATICFAILURE) }
        /// ICAL_TASKMODE_AUTOMATICSTATUS
        public static var AUTOMATICSTATUS: Value { .init(rawValue: ICAL_TASKMODE_AUTOMATICSTATUS) }
        /// ICAL_TASKMODE_NONE
        public static var NONE: Value { .init(rawValue: ICAL_TASKMODE_NONE) }

    }
}

extension icalproperty_taskmode: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_taskmode {
    
    /// wrap
    /// - Returns: PropTaskMode.Value
    internal func wrap() -> PropTaskMode.Value {
        return .init(rawValue: base)
    }
}
