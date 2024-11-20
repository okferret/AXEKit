//
//  Parameter+CuType.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_cutype
extension Parameter {
    /// icalparameter_cutype
    public struct CuType: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_cutype
        public let rawValue: icalparameter_cutype
        public init(rawValue: icalparameter_cutype) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.CuType {
    /// ICAL_CUTYPE_X
    public static var X: Parameter.CuType { .init(rawValue: ICAL_CUTYPE_X) }
    /// ICAL_CUTYPE_INDIVIDUAL
    public static var INDIVIDUAL: Parameter.CuType { .init(rawValue: ICAL_CUTYPE_INDIVIDUAL) }
    /// ICAL_CUTYPE_GROUP
    public static var GROUP: Parameter.CuType { .init(rawValue: ICAL_CUTYPE_GROUP) }
    /// ICAL_CUTYPE_RESOURCE
    public static var RESOURCE: Parameter.CuType { .init(rawValue: ICAL_CUTYPE_RESOURCE) }
    /// ICAL_CUTYPE_ROOM
    public static var ROOM: Parameter.CuType { .init(rawValue: ICAL_CUTYPE_ROOM) }
    /// ICAL_CUTYPE_UNKNOWN
    public static var UNKNOWN: Parameter.CuType { .init(rawValue: ICAL_CUTYPE_UNKNOWN) }
    /// ICAL_CUTYPE_NONE
    public static var NONE: Parameter.CuType { .init(rawValue: ICAL_CUTYPE_NONE) }
}

extension icalparameter_cutype: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_cutype {
    /// wrap
    /// - Returns: Parameter.CuType
    internal func wrap() -> Parameter.CuType {
        return .init(rawValue: base)
    }
}

