//
//  Parameter+FbType.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_fbtype
extension Parameter {
    /// icalparameter_fbtype
    public struct FbType: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_fbtype
        public let rawValue: icalparameter_fbtype
        public init(rawValue: icalparameter_fbtype) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.FbType {
    /// ICAL_FBTYPE_X
    public static var X: Parameter.FbType { .init(rawValue: ICAL_FBTYPE_X) }
    /// ICAL_FBTYPE_FREE
    public static var FREE: Parameter.FbType { .init(rawValue: ICAL_FBTYPE_FREE) }
    /// ICAL_FBTYPE_BUSY
    public static var BUSY: Parameter.FbType { .init(rawValue: ICAL_FBTYPE_BUSY) }
    /// ICAL_FBTYPE_BUSYUNAVAILABLE
    public static var BUSYUNAVAILABLE: Parameter.FbType { .init(rawValue: ICAL_FBTYPE_BUSYUNAVAILABLE) }
    /// ICAL_FBTYPE_BUSYTENTATIVE
    public static var BUSYTENTATIVE: Parameter.FbType { .init(rawValue: ICAL_FBTYPE_BUSYTENTATIVE) }
    /// ICAL_FBTYPE_NONE
    public static var NONE: Parameter.FbType { .init(rawValue: ICAL_FBTYPE_NONE) }
}

extension icalparameter_fbtype: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_fbtype {
    /// wrap
    /// - Returns: Parameter.FbType
    internal func wrap() -> Parameter.FbType {
        return .init(rawValue: base)
    }
}

