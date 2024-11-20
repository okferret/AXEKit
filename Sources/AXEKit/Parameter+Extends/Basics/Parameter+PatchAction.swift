//
//  Parameter+PatchAction.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_patchaction
extension Parameter {
    /// icalparameter_patchaction
    public struct PatchAction: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_patchaction
        public let rawValue: icalparameter_patchaction
        public init(rawValue: icalparameter_patchaction) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.PatchAction {
    /// ICAL_PATCHACTION_X
    public static var X: Parameter.PatchAction { .init(rawValue: ICAL_PATCHACTION_X) }
    /// ICAL_PATCHACTION_CREATE
    public static var CREATE: Parameter.PatchAction { .init(rawValue: ICAL_PATCHACTION_CREATE) }
    /// ICAL_PATCHACTION_BYNAME
    public static var BYNAME: Parameter.PatchAction { .init(rawValue: ICAL_PATCHACTION_BYNAME) }
    /// ICAL_PATCHACTION_BYVALUE
    public static var BYVALUE: Parameter.PatchAction { .init(rawValue: ICAL_PATCHACTION_BYVALUE) }
    /// ICAL_PATCHACTION_BYPARAM
    public static var BYPARAM: Parameter.PatchAction { .init(rawValue: ICAL_PATCHACTION_BYPARAM) }
    /// ICAL_PATCHACTION_NONE
    public static var NONE: Parameter.PatchAction { .init(rawValue: ICAL_PATCHACTION_NONE) }
}

extension icalparameter_patchaction: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_patchaction {
    /// wrap
    /// - Returns: Parameter.PatchAction
    internal func wrap() -> Parameter.PatchAction {
        return .init(rawValue: base)
    }
}
