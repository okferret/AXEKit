//
//  Parameter+XlicErrorType.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_xlicerrortype
extension Parameter {
    /// icalparameter_xlicerrortype
    public struct XlicErrorType: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_xlicerrortype
        public let rawValue: icalparameter_xlicerrortype
        public init(rawValue: icalparameter_xlicerrortype) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.XlicErrorType {
    /// ICAL_XLICERRORTYPE_X
    public static var X: Parameter.XlicErrorType { .init(rawValue: ICAL_XLICERRORTYPE_X) }
    /// ICAL_XLICERRORTYPE_COMPONENTPARSEERROR
    public static var COMPONENTPARSEERROR: Parameter.XlicErrorType { .init(rawValue: ICAL_XLICERRORTYPE_COMPONENTPARSEERROR) }
    /// ICAL_XLICERRORTYPE_PROPERTYPARSEERROR
    public static var PROPERTYPARSEERROR: Parameter.XlicErrorType { .init(rawValue: ICAL_XLICERRORTYPE_PROPERTYPARSEERROR) }
    /// ICAL_XLICERRORTYPE_PARAMETERNAMEPARSEERROR
    public static var PARAMETERNAMEPARSEERROR: Parameter.XlicErrorType { .init(rawValue: ICAL_XLICERRORTYPE_PARAMETERNAMEPARSEERROR) }
    /// ICAL_XLICERRORTYPE_PARAMETERVALUEPARSEERROR
    public static var PARAMETERVALUEPARSEERROR: Parameter.XlicErrorType { .init(rawValue: ICAL_XLICERRORTYPE_PARAMETERVALUEPARSEERROR) }
    /// ICAL_XLICERRORTYPE_VALUEPARSEERROR
    public static var VALUEPARSEERROR: Parameter.XlicErrorType { .init(rawValue: ICAL_XLICERRORTYPE_VALUEPARSEERROR) }
    /// ICAL_XLICERRORTYPE_INVALIDITIP
    public static var INVALIDITIP: Parameter.XlicErrorType { .init(rawValue: ICAL_XLICERRORTYPE_INVALIDITIP) }
    /// ICAL_XLICERRORTYPE_UNKNOWNVCALPROPERROR
    public static var UNKNOWNVCALPROPERROR: Parameter.XlicErrorType { .init(rawValue: ICAL_XLICERRORTYPE_UNKNOWNVCALPROPERROR) }
    /// ICAL_XLICERRORTYPE_MIMEPARSEERROR
    public static var MIMEPARSEERROR: Parameter.XlicErrorType { .init(rawValue: ICAL_XLICERRORTYPE_MIMEPARSEERROR) }
    /// ICAL_XLICERRORTYPE_VCALPROPPARSEERROR
    public static var VCALPROPPARSEERROR: Parameter.XlicErrorType { .init(rawValue: ICAL_XLICERRORTYPE_VCALPROPPARSEERROR) }
    /// ICAL_XLICERRORTYPE_NONE
    public static var NONE: Parameter.XlicErrorType { .init(rawValue: ICAL_XLICERRORTYPE_NONE) }
}

extension icalparameter_xlicerrortype: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_xlicerrortype {
    /// wrap
    /// - Returns: Parameter.XlicErrorType
    internal func wrap() -> Parameter.XlicErrorType {
        return .init(rawValue: base)
    }
}
