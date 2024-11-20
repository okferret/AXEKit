//
//  Parameter+Feature.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_feature
extension Parameter {
    /// icalparameter_feature
    public struct Feature: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_feature
        public let rawValue: icalparameter_feature
        public init(rawValue: icalparameter_feature) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Feature {
    
    /// ICAL_FEATURE_X
    public static var X: Parameter.Feature { .init(rawValue: ICAL_FEATURE_X) }
    /// ICAL_FEATURE_AUDIO
    public static var AUDIO: Parameter.Feature { .init(rawValue: ICAL_FEATURE_AUDIO) }
    /// ICAL_FEATURE_CHAT
    public static var CHAT: Parameter.Feature { .init(rawValue: ICAL_FEATURE_CHAT) }
    /// ICAL_FEATURE_FEED
    public static var FEED: Parameter.Feature { .init(rawValue: ICAL_FEATURE_FEED) }
    /// ICAL_FEATURE_MODERATOR
    public static var MODERATOR: Parameter.Feature { .init(rawValue: ICAL_FEATURE_MODERATOR) }
    /// ICAL_FEATURE_PHONE
    public static var PHONE: Parameter.Feature { .init(rawValue: ICAL_FEATURE_PHONE) }
    /// ICAL_FEATURE_SCREEN
    public static var SCREEN: Parameter.Feature { .init(rawValue: ICAL_FEATURE_SCREEN) }
    /// ICAL_FEATURE_VIDEO
    public static var VIDEO: Parameter.Feature { .init(rawValue: ICAL_FEATURE_VIDEO) }
    /// ICAL_FEATURE_NONE
    public static var NONE: Parameter.Feature { .init(rawValue: ICAL_FEATURE_NONE) }
}

extension icalparameter_feature: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_feature {
    /// wrap
    /// - Returns: Parameter.Feature
    internal func wrap() -> Parameter.Feature {
        return .init(rawValue: base)
    }
}
