//
//  Parameter+XlicCompareType.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_xliccomparetype
extension Parameter {
    /// icalparameter_xliccomparetype
    public struct XlicCompareType: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_xliccomparetype
        public let rawValue: icalparameter_xliccomparetype
        public init(rawValue: icalparameter_xliccomparetype) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.XlicCompareType {
    /// ICAL_XLICCOMPARETYPE_X
    public static var X: Parameter.XlicCompareType { .init(rawValue: ICAL_XLICCOMPARETYPE_X) }
    /// ICAL_XLICCOMPARETYPE_EQUAL
    public static var EQUAL: Parameter.XlicCompareType { .init(rawValue: ICAL_XLICCOMPARETYPE_EQUAL) }
    /// ICAL_XLICCOMPARETYPE_NOTEQUAL
    public static var NOTEQUAL: Parameter.XlicCompareType { .init(rawValue: ICAL_XLICCOMPARETYPE_NOTEQUAL) }
    /// ICAL_XLICCOMPARETYPE_LESS
    public static var LESS: Parameter.XlicCompareType { .init(rawValue: ICAL_XLICCOMPARETYPE_LESS) }
    /// ICAL_XLICCOMPARETYPE_GREATER
    public static var GREATER: Parameter.XlicCompareType { .init(rawValue: ICAL_XLICCOMPARETYPE_GREATER) }
    /// ICAL_XLICCOMPARETYPE_LESSEQUAL
    public static var LESSEQUAL: Parameter.XlicCompareType { .init(rawValue: ICAL_XLICCOMPARETYPE_LESSEQUAL) }
    /// ICAL_XLICCOMPARETYPE_GREATEREQUAL
    public static var GREATEREQUAL: Parameter.XlicCompareType { .init(rawValue: ICAL_XLICCOMPARETYPE_GREATEREQUAL) }
    /// ICAL_XLICCOMPARETYPE_REGEX
    public static var REGEX: Parameter.XlicCompareType { .init(rawValue: ICAL_XLICCOMPARETYPE_REGEX) }
    /// ICAL_XLICCOMPARETYPE_ISNULL
    public static var ISNULL: Parameter.XlicCompareType { .init(rawValue: ICAL_XLICCOMPARETYPE_ISNULL) }
    /// ICAL_XLICCOMPARETYPE_ISNOTNULL
    public static var ISNOTNULL: Parameter.XlicCompareType { .init(rawValue: ICAL_XLICCOMPARETYPE_ISNOTNULL) }
    /// ICAL_XLICCOMPARETYPE_NONE
    public static var NONE: Parameter.XlicCompareType { .init(rawValue: ICAL_XLICCOMPARETYPE_NONE) }
}

extension icalparameter_xliccomparetype: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_xliccomparetype {
    /// wrap
    /// - Returns: Parameter.XlicCompareType
    internal func wrap() -> Parameter.XlicCompareType {
        return .init(rawValue: base)
    }
}
