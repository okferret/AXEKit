//
//  Parameter+Encoding.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_encoding
extension Parameter {
    /// icalparameter_encoding
    public struct Encoding: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_encoding
        public let rawValue: icalparameter_encoding
        public init(rawValue: icalparameter_encoding) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Encoding {
    /// ICAL_ENCODING_X
    public static var X: Parameter.Encoding { .init(rawValue: ICAL_ENCODING_X) }
    /// ICAL_ENCODING_8BIT
    public static var x8BIT: Parameter.Encoding { .init(rawValue: ICAL_ENCODING_8BIT) }
    /// ICAL_ENCODING_BASE64
    public static var BASE64: Parameter.Encoding { .init(rawValue: ICAL_ENCODING_BASE64) }
    /// ICAL_ENCODING_NONE
    public static var NONE: Parameter.Encoding { .init(rawValue: ICAL_ENCODING_NONE) }
}

extension icalparameter_encoding: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_encoding {
    /// wrap
    /// - Returns: Parameter.Encoding
    internal func wrap() -> Parameter.Encoding {
        return .init(rawValue: base)
    }
}

