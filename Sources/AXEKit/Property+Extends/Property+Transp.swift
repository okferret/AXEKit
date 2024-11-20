//
//  Property+Transp.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalproperty_transp
extension Property {
    /// icalproperty_transp
    public struct Transp: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_transp
        public let rawValue: icalproperty_transp
        public init(rawValue: icalproperty_transp) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Property.Transp {
    /// ICAL_TRANSP_X
    public static var X: Property.Transp { .init(rawValue: ICAL_TRANSP_X) }
    /// ICAL_TRANSP_OPAQUE
    public static var OPAQUE: Property.Transp { .init(rawValue: ICAL_TRANSP_OPAQUE) }
    /// ICAL_TRANSP_OPAQUENOCONFLICT
    public static var OPAQUENOCONFLICT: Property.Transp { .init(rawValue: ICAL_TRANSP_OPAQUENOCONFLICT) }
    /// ICAL_TRANSP_TRANSPARENT
    public static var TRANSPARENT: Property.Transp { .init(rawValue: ICAL_TRANSP_TRANSPARENT) }
    /// ICAL_TRANSP_TRANSPARENTNOCONFLICT
    public static var TRANSPARENTNOCONFLICT: Property.Transp { .init(rawValue: ICAL_TRANSP_TRANSPARENTNOCONFLICT) }
    /// ICAL_TRANSP_NONE
    public static var NONE: Property.Transp { .init(rawValue: ICAL_TRANSP_NONE) }
}

extension icalproperty_transp: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_transp {
    /// wrap
    /// - Returns: Property.Transp
    internal func wrap() -> Property.Transp {
        return .init(rawValue: base)
    }
}

