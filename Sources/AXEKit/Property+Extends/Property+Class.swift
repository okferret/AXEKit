//
//  Property+Class.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalproperty_class
extension Property {
    /// icalproperty_class
    public struct Class: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_class
        public let rawValue: icalproperty_class
        public init(rawValue: icalproperty_class) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Property.Class {
    /// ICAL_CLASS_X
    public static var X: Property.Class { .init(rawValue: ICAL_CLASS_X) }
    /// ICAL_CLASS_PUBLIC
    public static var PUBLIC: Property.Class { .init(rawValue: ICAL_CLASS_PUBLIC) }
    /// ICAL_CLASS_PRIVATE
    public static var PRIVATE: Property.Class { .init(rawValue: ICAL_CLASS_PRIVATE) }
    /// ICAL_CLASS_CONFIDENTIAL
    public static var CONFIDENTIAL: Property.Class { .init(rawValue: ICAL_CLASS_CONFIDENTIAL) }
    /// ICAL_CLASS_NONE
    public static var NONE: Property.Class { .init(rawValue: ICAL_CLASS_NONE) }
}

extension icalproperty_class: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_class {
    /// wrap
    /// - Returns: Property.Class
    internal func wrap() -> Property.Class {
        return .init(rawValue: base)
    }
}
