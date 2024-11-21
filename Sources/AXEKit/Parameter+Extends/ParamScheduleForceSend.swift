//
//  ParamScheduleForceSend.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamScheduleForceSend
public class ParamScheduleForceSend: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_scheduleforcesend(rawValue).hub.wrap() }
        set { icalparameter_set_scheduleforcesend(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_scheduleforcesend(value.rawValue))
    }
}

extension ParamScheduleForceSend {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_scheduleforcesend
        public let rawValue: icalparameter_scheduleforcesend
        public init(rawValue: icalparameter_scheduleforcesend) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_SCHEDULEFORCESEND_X
        public static var X: Value { .init(rawValue: ICAL_SCHEDULEFORCESEND_X) }
        /// ICAL_SCHEDULEFORCESEND_REQUEST
        public static var REQUEST: Value { .init(rawValue: ICAL_SCHEDULEFORCESEND_REQUEST) }
        /// ICAL_SCHEDULEFORCESEND_REPLY
        public static var REPLY: Value { .init(rawValue: ICAL_SCHEDULEFORCESEND_REPLY) }
        /// ICAL_SCHEDULEFORCESEND_NONE
        public static var NONE: Value { .init(rawValue: ICAL_SCHEDULEFORCESEND_NONE) }

    }
}

extension icalparameter_scheduleforcesend: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_scheduleforcesend {
    
    /// wrap
    /// - Returns: ParamScheduleForceSend.Value
    internal func wrap() -> ParamScheduleForceSend.Value {
        return .init(rawValue: base)
    }
}
