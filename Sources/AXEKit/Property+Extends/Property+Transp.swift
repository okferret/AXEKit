//
//  Property+Transp.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Transp
    public class Transp: Property {
        
        /// Value
        public var value: Value {
            get { icalproperty_get_transp(rawValue).hub.wrap() }
            set { icalproperty_set_transp(rawValue, newValue.rawValue) }
        }
        
        /// 构建
        /// - Parameter value: Value
        public convenience init(_ value: Value) {
            self.init(rawValue: icalproperty_new_transp(value.rawValue))
        }
    }
}

extension Property.Transp {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_transp
        public let rawValue: icalproperty_transp
        public init(rawValue: icalproperty_transp) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_TRANSP_X
        public static var X: Value { .init(rawValue: ICAL_TRANSP_X) }
        /// ICAL_TRANSP_OPAQUE
        public static var OPAQUE: Value { .init(rawValue: ICAL_TRANSP_OPAQUE) }
        /// ICAL_TRANSP_OPAQUENOCONFLICT
        public static var OPAQUENOCONFLICT: Value { .init(rawValue: ICAL_TRANSP_OPAQUENOCONFLICT) }
        /// ICAL_TRANSP_TRANSPARENT
        public static var TRANSPARENT: Value { .init(rawValue: ICAL_TRANSP_TRANSPARENT) }
        /// ICAL_TRANSP_TRANSPARENTNOCONFLICT
        public static var TRANSPARENTNOCONFLICT: Value { .init(rawValue: ICAL_TRANSP_TRANSPARENTNOCONFLICT) }
        /// ICAL_TRANSP_NONE
        public static var NONE: Value { .init(rawValue: ICAL_TRANSP_NONE) }
    }
}

extension icalproperty_transp: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_transp {
    
    /// wrap
    /// - Returns: Property.Transp.Value
    internal func wrap() -> Property.Transp.Value {
        return .init(rawValue: base)
    }
}
