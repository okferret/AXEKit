//
//  ParamFbtype.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamFbtype
public class ParamFbtype: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_fbtype(rawValue).hub.wrap() }
        set { icalparameter_set_fbtype(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_fbtype(value.rawValue))
    }
}

extension ParamFbtype {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_fbtype
        public let rawValue: icalparameter_fbtype
        public init(rawValue: icalparameter_fbtype) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_FBTYPE_X
        public static var X: Value { .init(rawValue: ICAL_FBTYPE_X) }
        /// ICAL_FBTYPE_FREE
        public static var FREE: Value { .init(rawValue: ICAL_FBTYPE_FREE) }
        /// ICAL_FBTYPE_BUSY
        public static var BUSY: Value { .init(rawValue: ICAL_FBTYPE_BUSY) }
        /// ICAL_FBTYPE_BUSYUNAVAILABLE
        public static var BUSYUNAVAILABLE: Value { .init(rawValue: ICAL_FBTYPE_BUSYUNAVAILABLE) }
        /// ICAL_FBTYPE_BUSYTENTATIVE
        public static var BUSYTENTATIVE: Value { .init(rawValue: ICAL_FBTYPE_BUSYTENTATIVE) }
        /// ICAL_FBTYPE_NONE
        public static var NONE: Value { .init(rawValue: ICAL_FBTYPE_NONE) }
    }
}

extension icalparameter_fbtype: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_fbtype {
    
    /// wrap
    /// - Returns: ParamFbtype.Value
    internal func wrap() -> ParamFbtype.Value {
        return .init(rawValue: base)
    }
}
