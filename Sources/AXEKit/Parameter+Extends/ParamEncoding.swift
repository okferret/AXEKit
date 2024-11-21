//
//  ParamEncoding.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamEncoding
public class ParamEncoding: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_encoding(rawValue).hub.wrap() }
        set { icalparameter_set_encoding(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_encoding(value.rawValue))
    }
}

extension ParamEncoding {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_encoding
        public let rawValue: icalparameter_encoding
        public init(rawValue: icalparameter_encoding) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_ENCODING_X
        public static var X: Value { .init(rawValue: ICAL_ENCODING_X) }
        /// ICAL_ENCODING_8BIT
        public static var x8BIT: Value { .init(rawValue: ICAL_ENCODING_8BIT) }
        /// ICAL_ENCODING_BASE64
        public static var BASE64: Value { .init(rawValue: ICAL_ENCODING_BASE64) }
        /// ICAL_ENCODING_NONE
        public static var NONE: Value { .init(rawValue: ICAL_ENCODING_NONE) }
    }
}

extension icalparameter_encoding: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_encoding {
    
    /// wrap
    /// - Returns: ParamEncoding.Value
    internal func wrap() -> ParamEncoding.Value {
        return .init(rawValue: base)
    }
}
