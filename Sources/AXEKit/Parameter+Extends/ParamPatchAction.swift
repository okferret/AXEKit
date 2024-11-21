//
//  ParamPatchAction.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamPatchAction
public class ParamPatchAction: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_patchaction(rawValue).hub.wrap() }
        set { icalparameter_set_patchaction(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_patchaction(value.rawValue))
    }
}

extension ParamPatchAction {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_patchaction
        public let rawValue: icalparameter_patchaction
        public init(rawValue: icalparameter_patchaction) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_PATCHACTION_X
        public static var X: Value { .init(rawValue: ICAL_PATCHACTION_X) }
        /// ICAL_PATCHACTION_CREATE
        public static var CREATE: Value { .init(rawValue: ICAL_PATCHACTION_CREATE) }
        /// ICAL_PATCHACTION_BYNAME
        public static var BYNAME: Value { .init(rawValue: ICAL_PATCHACTION_BYNAME) }
        /// ICAL_PATCHACTION_BYVALUE
        public static var BYVALUE: Value { .init(rawValue: ICAL_PATCHACTION_BYVALUE) }
        /// ICAL_PATCHACTION_BYPARAM
        public static var BYPARAM: Value { .init(rawValue: ICAL_PATCHACTION_BYPARAM) }
        /// ICAL_PATCHACTION_NONE
        public static var NONE: Value { .init(rawValue: ICAL_PATCHACTION_NONE) }
    }
}

extension icalparameter_patchaction: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_patchaction {
    
    /// wrap
    /// - Returns: ParamPatchAction.Value
    internal func wrap() -> ParamPatchAction.Value {
        return .init(rawValue: base)
    }
}
