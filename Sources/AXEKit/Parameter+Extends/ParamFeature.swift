//
//  ParamFeature.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamFeature
public class ParamFeature: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_feature(rawValue).hub.wrap() }
        set { icalparameter_set_feature(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_feature(value.rawValue))
    }
}

extension ParamFeature {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_feature
        public let rawValue: icalparameter_feature
        public init(rawValue: icalparameter_feature) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_FEATURE_X
        public static var X: Value { .init(rawValue: ICAL_FEATURE_X) }
        /// ICAL_FEATURE_AUDIO
        public static var AUDIO: Value { .init(rawValue: ICAL_FEATURE_AUDIO) }
        /// ICAL_FEATURE_CHAT
        public static var CHAT: Value { .init(rawValue: ICAL_FEATURE_CHAT) }
        /// ICAL_FEATURE_FEED
        public static var FEED: Value { .init(rawValue: ICAL_FEATURE_FEED) }
        /// ICAL_FEATURE_MODERATOR
        public static var MODERATOR: Value { .init(rawValue: ICAL_FEATURE_MODERATOR) }
        /// ICAL_FEATURE_PHONE
        public static var PHONE: Value { .init(rawValue: ICAL_FEATURE_PHONE) }
        /// ICAL_FEATURE_SCREEN
        public static var SCREEN: Value { .init(rawValue: ICAL_FEATURE_SCREEN) }
        /// ICAL_FEATURE_VIDEO
        public static var VIDEO: Value { .init(rawValue: ICAL_FEATURE_VIDEO) }
        /// ICAL_FEATURE_NONE
        public static var NONE: Value { .init(rawValue: ICAL_FEATURE_NONE) }

    }
}

extension icalparameter_feature: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_feature {
    
    /// wrap
    /// - Returns: ParamFeature.Value
    internal func wrap() -> ParamFeature.Value {
        return .init(rawValue: base)
    }
}
