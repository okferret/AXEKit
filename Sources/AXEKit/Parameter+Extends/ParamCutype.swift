//
//  ParamCutype.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamCutype
public class ParamCutype: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_cutype(rawValue).hub.wrap() }
        set { icalparameter_set_cutype(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_cutype(value.rawValue))
    }
}

extension ParamCutype {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_cutype
        public let rawValue: icalparameter_cutype
        public init(rawValue: icalparameter_cutype) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_CUTYPE_X
        public static var X: Value { .init(rawValue: ICAL_CUTYPE_X) }
        /// ICAL_CUTYPE_INDIVIDUAL
        public static var INDIVIDUAL: Value { .init(rawValue: ICAL_CUTYPE_INDIVIDUAL) }
        /// ICAL_CUTYPE_GROUP
        public static var GROUP: Value { .init(rawValue: ICAL_CUTYPE_GROUP) }
        /// ICAL_CUTYPE_RESOURCE
        public static var RESOURCE: Value { .init(rawValue: ICAL_CUTYPE_RESOURCE) }
        /// ICAL_CUTYPE_ROOM
        public static var ROOM: Value { .init(rawValue: ICAL_CUTYPE_ROOM) }
        /// ICAL_CUTYPE_UNKNOWN
        public static var UNKNOWN: Value { .init(rawValue: ICAL_CUTYPE_UNKNOWN) }
        /// ICAL_CUTYPE_NONE
        public static var NONE: Value { .init(rawValue: ICAL_CUTYPE_NONE) }
    }
}

extension icalparameter_cutype: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_cutype {
    
    /// wrap
    /// - Returns: ParamCutype.Value
    internal func wrap() -> ParamCutype.Value {
        return .init(rawValue: base)
    }
}
