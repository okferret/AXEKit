//
//  ParamRole.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamRole
public class ParamRole: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_role(rawValue).hub.wrap() }
        set { icalparameter_set_role(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_role(value.rawValue))
    }
}

extension ParamRole {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_role
        public let rawValue: icalparameter_role
        public init(rawValue: icalparameter_role) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_ROLE_X
        public static var X: Value { .init(rawValue: ICAL_ROLE_X) }
        /// ICAL_ROLE_CHAIR
        public static var CHAIR: Value { .init(rawValue: ICAL_ROLE_CHAIR) }
        /// ICAL_ROLE_REQPARTICIPANT
        public static var REQPARTICIPANT: Value { .init(rawValue: ICAL_ROLE_REQPARTICIPANT) }
        /// ICAL_ROLE_OPTPARTICIPANT
        public static var OPTPARTICIPANT: Value { .init(rawValue: ICAL_ROLE_OPTPARTICIPANT) }
        /// ICAL_ROLE_NONPARTICIPANT
        public static var NONPARTICIPANT: Value { .init(rawValue: ICAL_ROLE_NONPARTICIPANT) }
        /// ICAL_ROLE_NONE
        public static var NONE: Value { .init(rawValue: ICAL_ROLE_NONE) }

    }
}

extension icalparameter_role: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_role {
    
    /// wrap
    /// - Returns: ParamRole.Value
    internal func wrap() -> ParamRole.Value {
        return .init(rawValue: base)
    }
}
