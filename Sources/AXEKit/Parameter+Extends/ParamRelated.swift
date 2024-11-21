//
//  ParamRelated.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamRelated
public class ParamRelated: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_related(rawValue).hub.wrap() }
        set { icalparameter_set_related(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_related(value.rawValue))
    }
}

extension ParamRelated {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_related
        public let rawValue: icalparameter_related
        public init(rawValue: icalparameter_related) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_RELATED_X
        public static var X: Value { .init(rawValue: ICAL_RELATED_X) }
        /// ICAL_RELATED_START
        public static var START: Value { .init(rawValue: ICAL_RELATED_START) }
        /// ICAL_RELATED_END
        public static var END: Value { .init(rawValue: ICAL_RELATED_END) }
        /// ICAL_RELATED_NONE
        public static var NONE: Value { .init(rawValue: ICAL_RELATED_NONE) }
    }
}

extension icalparameter_related: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_related {
    
    /// wrap
    /// - Returns: ParamRelated.Value
    internal func wrap() -> ParamRelated.Value {
        return .init(rawValue: base)
    }
}
