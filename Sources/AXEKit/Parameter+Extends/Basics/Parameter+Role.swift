//
//  Parameter+Role.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_role
extension Parameter {
    /// icalparameter_role
    public struct Role: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_role
        public let rawValue: icalparameter_role
        public init(rawValue: icalparameter_role) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Role {
    /// ICAL_ROLE_X
    public static var X: Parameter.Role { .init(rawValue: ICAL_ROLE_X) }
    /// ICAL_ROLE_CHAIR
    public static var CHAIR: Parameter.Role { .init(rawValue: ICAL_ROLE_CHAIR) }
    /// ICAL_ROLE_REQPARTICIPANT
    public static var REQPARTICIPANT: Parameter.Role { .init(rawValue: ICAL_ROLE_REQPARTICIPANT) }
    /// ICAL_ROLE_OPTPARTICIPANT
    public static var OPTPARTICIPANT: Parameter.Role { .init(rawValue: ICAL_ROLE_OPTPARTICIPANT) }
    /// ICAL_ROLE_NONPARTICIPANT
    public static var NONPARTICIPANT: Parameter.Role { .init(rawValue: ICAL_ROLE_NONPARTICIPANT) }
    /// ICAL_ROLE_NONE
    public static var NONE: Parameter.Role { .init(rawValue: ICAL_ROLE_NONE) }
}

extension icalparameter_role: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_role {
    /// wrap
    /// - Returns: Parameter.Role
    internal func wrap() -> Parameter.Role {
        return .init(rawValue: base)
    }
}
