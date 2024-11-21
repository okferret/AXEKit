//
//  ParamReltype.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// ParamReltype
public class ParamReltype: Parameter {
    
    /// Value
    public var value: Value {
        get { icalparameter_get_reltype(rawValue).hub.wrap() }
        set { icalparameter_set_reltype(rawValue, newValue.rawValue) }
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(_ value: Value) {
        self.init(rawValue: icalparameter_new_reltype(value.rawValue))
    }
}

extension ParamReltype {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_reltype
        public let rawValue: icalparameter_reltype
        public init(rawValue: icalparameter_reltype) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_RELTYPE_X
        public static var X: Value { .init(rawValue: ICAL_RELTYPE_X) }
        /// ICAL_RELTYPE_PARENT
        public static var PARENT: Value { .init(rawValue: ICAL_RELTYPE_PARENT) }
        /// ICAL_RELTYPE_CHILD
        public static var CHILD: Value { .init(rawValue: ICAL_RELTYPE_CHILD) }
        /// ICAL_RELTYPE_SIBLING
        public static var SIBLING: Value { .init(rawValue: ICAL_RELTYPE_SIBLING) }
        /// ICAL_RELTYPE_POLL
        public static var POLL: Value { .init(rawValue: ICAL_RELTYPE_POLL) }
        /// ICAL_RELTYPE_NONE
        public static var NONE: Value { .init(rawValue: ICAL_RELTYPE_NONE) }
    }
}

extension icalparameter_reltype: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_reltype {
    
    /// wrap
    /// - Returns: ParamReltype.Value
    internal func wrap() -> ParamReltype.Value {
        return .init(rawValue: base)
    }
}
