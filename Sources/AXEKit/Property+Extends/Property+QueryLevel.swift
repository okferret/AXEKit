//
//  Property+QueryLevel.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// QueryLevel
    public class QueryLevel: Property {
        
        /// Value
        public var value: Value {
            get { icalproperty_get_querylevel(rawValue).hub.wrap() }
            set { icalproperty_set_querylevel(rawValue, newValue.rawValue) }
        }
        
        /// 构建
        /// - Parameter value: Value
        public convenience init(_ value: Value) {
            self.init(rawValue: icalproperty_new_querylevel(value.rawValue))
        }
    }
}

extension Property.QueryLevel {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_querylevel
        public let rawValue: icalproperty_querylevel
        public init(rawValue: icalproperty_querylevel) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_QUERYLEVEL_X
        public static var X: Value { .init(rawValue: ICAL_QUERYLEVEL_X) }
        /// ICAL_QUERYLEVEL_CALQL1
        public static var CALQL1: Value { .init(rawValue: ICAL_QUERYLEVEL_CALQL1) }
        /// ICAL_QUERYLEVEL_CALQLNONE
        public static var CALQLNONE: Value { .init(rawValue: ICAL_QUERYLEVEL_CALQLNONE) }
        /// ICAL_QUERYLEVEL_NONE
        public static var NONE: Value { .init(rawValue: ICAL_QUERYLEVEL_NONE) }
    }
}

extension icalproperty_querylevel: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_querylevel {
    
    /// wrap
    /// - Returns: Property.QueryLevel.Value
    internal func wrap() -> Property.QueryLevel.Value {
        return .init(rawValue: base)
    }
}
