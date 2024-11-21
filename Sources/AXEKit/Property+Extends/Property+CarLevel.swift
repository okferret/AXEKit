//
//  Property+CarLevel.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// CarLevel
    public class CarLevel: Property {
        
        /// Value
        public var value: Value {
            get { icalproperty_get_carlevel(rawValue).hub.wrap() }
            set { icalproperty_set_carlevel(rawValue, newValue.rawValue) }
        }
        
        /// 构建
        /// - Parameter value: Value
        public convenience init(_ value: Value) {
            self.init(rawValue: icalproperty_new_carlevel(value.rawValue))
        }
    }
}

extension Property.CarLevel {
    
    /// RawRepresentable
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_carlevel
        public let rawValue: icalproperty_carlevel
        public init(rawValue: icalproperty_carlevel) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_CARLEVEL_X
        public static var X: Value { .init(rawValue: ICAL_CARLEVEL_X) }
        /// ICAL_CARLEVEL_CARNONE
        public static var CARNONE: Value { .init(rawValue: ICAL_CARLEVEL_CARNONE) }
        /// ICAL_CARLEVEL_CARMIN
        public static var CARMIN: Value { .init(rawValue: ICAL_CARLEVEL_CARMIN) }
        /// ICAL_CARLEVEL_CARFULL1
        public static var CARFULL1: Value { .init(rawValue: ICAL_CARLEVEL_CARFULL1) }
        /// ICAL_CARLEVEL_NONE
        public static var NONE: Value { .init(rawValue: ICAL_CARLEVEL_NONE) }
    }
}

extension icalproperty_carlevel: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_carlevel {
    
    /// wrap
    /// - Returns: Property.CarLevel.Value
    internal func wrap() -> Property.CarLevel.Value {
        return .init(rawValue: base)
    }
}
