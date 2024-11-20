//
//  Parameter+RelType.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_reltype
extension Parameter {
    /// icalparameter_reltype
    public struct RelType: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_reltype
        public let rawValue: icalparameter_reltype
        public init(rawValue: icalparameter_reltype) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.RelType {
    /// ICAL_RELTYPE_X
    public static var X: Parameter.RelType { .init(rawValue: ICAL_RELTYPE_X) }
    /// ICAL_RELTYPE_PARENT
    public static var PARENT: Parameter.RelType { .init(rawValue: ICAL_RELTYPE_PARENT) }
    /// ICAL_RELTYPE_CHILD
    public static var CHILD: Parameter.RelType { .init(rawValue: ICAL_RELTYPE_CHILD) }
    /// ICAL_RELTYPE_SIBLING
    public static var SIBLING: Parameter.RelType { .init(rawValue: ICAL_RELTYPE_SIBLING) }
    /// ICAL_RELTYPE_POLL
    public static var POLL: Parameter.RelType { .init(rawValue: ICAL_RELTYPE_POLL) }
    /// ICAL_RELTYPE_NONE
    public static var NONE: Parameter.RelType { .init(rawValue: ICAL_RELTYPE_NONE) }
}

extension icalparameter_reltype: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_reltype {
    /// wrap
    /// - Returns: Parameter.RelType
    internal func wrap() -> Parameter.RelType {
        return .init(rawValue: base)
    }
}
