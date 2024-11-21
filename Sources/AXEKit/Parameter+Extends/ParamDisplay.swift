//
//  ParamDisplay.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamDisplay
public class ParamDisplay: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_display(rawValue).hub.wrap() }
        set { icalparameter_set_display(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_display(value.rawValue))
    }
}

extension ParamDisplay {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_display
        public let rawValue: icalparameter_display
        public init(rawValue: icalparameter_display) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_DISPLAY_X
        public static var X: Value { .init(rawValue: ICAL_DISPLAY_X) }
        /// ICAL_DISPLAY_BADGE
        public static var BADGE: Value { .init(rawValue: ICAL_DISPLAY_BADGE) }
        /// ICAL_DISPLAY_GRAPHIC
        public static var GRAPHIC: Value { .init(rawValue: ICAL_DISPLAY_GRAPHIC) }
        /// ICAL_DISPLAY_FULLSIZE
        public static var FULLSIZE: Value { .init(rawValue: ICAL_DISPLAY_FULLSIZE) }
        /// ICAL_DISPLAY_THUMBNAIL
        public static var THUMBNAIL: Value { .init(rawValue: ICAL_DISPLAY_THUMBNAIL) }
        /// ICAL_DISPLAY_NONE
        public static var NONE: Value { .init(rawValue: ICAL_DISPLAY_NONE) }
    }
}

extension icalparameter_display: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_display {
    
    /// wrap
    /// - Returns: ParamDisplay.Value
    internal func wrap() -> ParamDisplay.Value {
        return .init(rawValue: base)
    }
}
