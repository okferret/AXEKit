//
//  PropBusyType.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropBusyType
public class PropBusyType: Property {
    
    /// Value
    public var value: Value {
        get { icalproperty_get_busytype(rawValue).hub.wrap() }
        set { icalproperty_set_busytype(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalproperty_new_busytype(value.rawValue))
    }
}

extension PropBusyType {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_busytype
        public let rawValue: icalproperty_busytype
        public init(rawValue: icalproperty_busytype) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_BUSYTYPE_X
        public static var X: Value { .init(rawValue: ICAL_BUSYTYPE_X) }
        /// ICAL_BUSYTYPE_BUSY
        public static var BUSY: Value { .init(rawValue: ICAL_BUSYTYPE_BUSY) }
        /// ICAL_BUSYTYPE_BUSYUNAVAILABLE
        public static var BUSYUNAVAILABLE: Value { .init(rawValue: ICAL_BUSYTYPE_BUSYUNAVAILABLE) }
        /// ICAL_BUSYTYPE_BUSYTENTATIVE
        public static var BUSYTENTATIVE: Value { .init(rawValue: ICAL_BUSYTYPE_BUSYTENTATIVE) }
        /// ICAL_BUSYTYPE_NONE
        public static var NONE: Value { .init(rawValue: ICAL_BUSYTYPE_NONE) }
    }
}

extension icalproperty_busytype: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_busytype {
    
    /// wrap
    /// - Returns: PropBusyType.Value
    internal func wrap() -> PropBusyType.Value {
        return .init(rawValue: base)
    }
}
