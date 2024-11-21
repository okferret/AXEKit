//
//  ParamStayInformed.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamStayInformed
public class ParamStayInformed: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_stayinformed(rawValue).hub.wrap() }
        set { icalparameter_set_stayinformed(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_stayinformed(value.rawValue))
    }
}

extension ParamStayInformed {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_stayinformed
        public let rawValue: icalparameter_stayinformed
        public init(rawValue: icalparameter_stayinformed) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_STAYINFORMED_X
        public static var X: Value { .init(rawValue: ICAL_STAYINFORMED_X) }
        /// ICAL_STAYINFORMED_TRUE
        public static var TRUE: Value { .init(rawValue: ICAL_STAYINFORMED_TRUE) }
        /// ICAL_STAYINFORMED_FALSE
        public static var FALSE: Value { .init(rawValue: ICAL_STAYINFORMED_FALSE) }
        /// ICAL_STAYINFORMED_NONE
        public static var NONE: Value { .init(rawValue: ICAL_STAYINFORMED_NONE) }
    }
}

extension icalparameter_stayinformed: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_stayinformed {
    
    /// wrap
    /// - Returns: ParamStayInformed.Value
    internal func wrap() -> ParamStayInformed.Value {
        return .init(rawValue: base)
    }
}
