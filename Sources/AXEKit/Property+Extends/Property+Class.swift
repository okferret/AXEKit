//
//  Property+Class.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Class
    public class Class: Property {
        
        /// Value
        public var value: Value {
            get { icalproperty_get_class(rawValue).hub.wrap() }
            set { icalproperty_set_class(rawValue, newValue.rawValue) }
        }
        
        /// 构建
        /// - Parameter value: Value
        public convenience init(_ value: Value) {
            self.init(rawValue: icalproperty_new_class(value.rawValue))
        }
    }
}

extension Property.Class {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_class
        public let rawValue: icalproperty_class
        public init(rawValue: icalproperty_class) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_CLASS_X
        public static var X: Value { .init(rawValue: ICAL_CLASS_X) }
        /// ICAL_CLASS_PUBLIC
        public static var PUBLIC: Value { .init(rawValue: ICAL_CLASS_PUBLIC) }
        /// ICAL_CLASS_PRIVATE
        public static var PRIVATE: Value { .init(rawValue: ICAL_CLASS_PRIVATE) }
        /// ICAL_CLASS_CONFIDENTIAL
        public static var CONFIDENTIAL: Value { .init(rawValue: ICAL_CLASS_CONFIDENTIAL) }
        /// ICAL_CLASS_NONE
        public static var NONE: Value { .init(rawValue: ICAL_CLASS_NONE) }
    }
}

extension icalproperty_class: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_class {
    
    /// wrap
    /// - Returns: Property.Class.Value
    internal func wrap() -> Property.Class.Value {
        return .init(rawValue: base)
    }
}
