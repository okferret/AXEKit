//
//  ParamRange.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamRange
public class ParamRange: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_range(rawValue).hub.wrap() }
        set { icalparameter_set_range(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_range(value.rawValue))
    }
}

extension ParamRange {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_range
        public let rawValue: icalparameter_range
        public init(rawValue: icalparameter_range) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_RANGE_X
        public static var X: Value { .init(rawValue: ICAL_RANGE_X) }
        /// ICAL_RANGE_THISANDPRIOR
        public static var THISANDPRIOR: Value { .init(rawValue: ICAL_RANGE_THISANDPRIOR) }
        /// ICAL_RANGE_THISANDFUTURE
        public static var THISANDFUTURE: Value { .init(rawValue: ICAL_RANGE_THISANDFUTURE) }
        /// ICAL_RANGE_NONE
        public static var NONE: Value { .init(rawValue: ICAL_RANGE_NONE) }
    }
}

extension icalparameter_range: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_range {
    
    /// wrap
    /// - Returns: ParamRange.Value
    internal func wrap() -> ParamRange.Value {
        return .init(rawValue: base)
    }
}
