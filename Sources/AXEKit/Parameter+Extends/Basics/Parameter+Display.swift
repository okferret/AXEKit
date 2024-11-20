//
//  Parameter+Display.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_display
extension Parameter {
    /// icalparameter_display
    public struct Display: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_display
        public let rawValue: icalparameter_display
        public init(rawValue: icalparameter_display) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Display {
    /// ICAL_DISPLAY_X
    public static var X: Parameter.Display { .init(rawValue: ICAL_DISPLAY_X) }
    /// ICAL_DISPLAY_BADGE
    public static var BADGE: Parameter.Display { .init(rawValue: ICAL_DISPLAY_BADGE) }
    /// ICAL_DISPLAY_GRAPHIC
    public static var GRAPHIC: Parameter.Display { .init(rawValue: ICAL_DISPLAY_GRAPHIC) }
    /// ICAL_DISPLAY_FULLSIZE
    public static var FULLSIZE : Parameter.Display { .init(rawValue: ICAL_DISPLAY_FULLSIZE) }
    /// ICAL_DISPLAY_THUMBNAIL
    public static var THUMBNAIL: Parameter.Display { .init(rawValue: ICAL_DISPLAY_THUMBNAIL) }
    /// ICAL_DISPLAY_NONE
    public static var NONE: Parameter.Display { .init(rawValue: ICAL_DISPLAY_NONE) }
}

extension icalparameter_display: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_display {
    /// wrap
    /// - Returns: Parameter.Display
    internal func wrap() -> Parameter.Display {
        return .init(rawValue: base)
    }
}
