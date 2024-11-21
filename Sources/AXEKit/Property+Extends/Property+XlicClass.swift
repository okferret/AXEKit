//
//  Property+XlicClass.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// XlicClass
    public class XlicClass: Property {
        
        /// Value
        public var value: Value {
            get { icalproperty_get_xlicclass(rawValue).hub.wrap() }
            set { icalproperty_set_xlicclass(rawValue, newValue.rawValue) }
        }
        
        /// 构建
        /// - Parameter value: Value
        public convenience init(_ value: Value) {
            self.init(rawValue: icalproperty_new_xlicclass(value.rawValue))
        }
    }
}

extension Property.XlicClass {
    
    /// Value
    public struct Value: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_xlicclass
        public let rawValue: icalproperty_xlicclass
        public init(rawValue: icalproperty_xlicclass) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
        /// ICAL_XLICCLASS_X
        public static var X: Value { .init(rawValue: ICAL_XLICCLASS_X) }
        /// ICAL_XLICCLASS_PUBLISHNEW
        public static var PUBLISHNEW: Value { .init(rawValue: ICAL_XLICCLASS_PUBLISHNEW) }
        /// ICAL_XLICCLASS_PUBLISHUPDATE
        public static var PUBLISHUPDATE: Value { .init(rawValue: ICAL_XLICCLASS_PUBLISHUPDATE) }
        /// ICAL_XLICCLASS_PUBLISHFREEBUSY
        public static var PUBLISHFREEBUSY: Value { .init(rawValue: ICAL_XLICCLASS_PUBLISHFREEBUSY) }
        /// ICAL_XLICCLASS_REQUESTNEW
        public static var REQUESTNEW: Value { .init(rawValue: ICAL_XLICCLASS_REQUESTNEW) }
        /// ICAL_XLICCLASS_REQUESTUPDATE
        public static var REQUESTUPDATE: Value { .init(rawValue: ICAL_XLICCLASS_REQUESTUPDATE) }
        /// ICAL_XLICCLASS_REQUESTRESCHEDULE
        public static var REQUESTRESCHEDULE: Value { .init(rawValue: ICAL_XLICCLASS_REQUESTRESCHEDULE) }
        /// ICAL_XLICCLASS_REQUESTDELEGATE
        public static var REQUESTDELEGATE: Value { .init(rawValue: ICAL_XLICCLASS_REQUESTDELEGATE) }
        /// ICAL_XLICCLASS_REQUESTNEWORGANIZER
        public static var REQUESTNEWORGANIZER: Value { .init(rawValue: ICAL_XLICCLASS_REQUESTNEWORGANIZER) }
        /// ICAL_XLICCLASS_REQUESTFORWARD
        public static var REQUESTFORWARD: Value { .init(rawValue: ICAL_XLICCLASS_REQUESTFORWARD) }
        /// ICAL_XLICCLASS_REQUESTSTATUS
        public static var REQUESTSTATUS: Value { .init(rawValue: ICAL_XLICCLASS_REQUESTSTATUS) }
        /// ICAL_XLICCLASS_REQUESTFREEBUSY
        public static var REQUESTFREEBUSY: Value { .init(rawValue: ICAL_XLICCLASS_REQUESTFREEBUSY) }
        /// ICAL_XLICCLASS_REPLYACCEPT
        public static var REPLYACCEPT: Value { .init(rawValue: ICAL_XLICCLASS_REPLYACCEPT) }
        /// ICAL_XLICCLASS_REPLYDECLINE
        public static var REPLYDECLINE: Value { .init(rawValue: ICAL_XLICCLASS_REPLYDECLINE) }
        /// ICAL_XLICCLASS_REPLYDELEGATE
        public static var REPLYDELEGATE: Value { .init(rawValue: ICAL_XLICCLASS_REPLYDELEGATE) }
        /// ICAL_XLICCLASS_REPLYCRASHERACCEPT
        public static var REPLYCRASHERACCEPT: Value { .init(rawValue: ICAL_XLICCLASS_REPLYCRASHERACCEPT) }
        /// ICAL_XLICCLASS_REPLYCRASHERDECLINE
        public static var REPLYCRASHERDECLINE: Value { .init(rawValue: ICAL_XLICCLASS_REPLYCRASHERDECLINE) }
        /// ICAL_XLICCLASS_ADDINSTANCE
        public static var ADDINSTANCE: Value { .init(rawValue: ICAL_XLICCLASS_ADDINSTANCE) }
        /// ICAL_XLICCLASS_CANCELEVENT
        public static var CANCELEVENT: Value { .init(rawValue: ICAL_XLICCLASS_CANCELEVENT) }
        /// ICAL_XLICCLASS_CANCELINSTANCE
        public static var CANCELINSTANCE: Value { .init(rawValue: ICAL_XLICCLASS_CANCELINSTANCE) }
        /// ICAL_XLICCLASS_CANCELALL
        public static var CANCELALL: Value { .init(rawValue: ICAL_XLICCLASS_CANCELALL) }
        /// ICAL_XLICCLASS_REFRESH
        public static var REFRESH: Value { .init(rawValue: ICAL_XLICCLASS_REFRESH) }
        /// ICAL_XLICCLASS_COUNTER
        public static var COUNTER: Value { .init(rawValue: ICAL_XLICCLASS_COUNTER) }
        /// ICAL_XLICCLASS_DECLINECOUNTER
        public static var DECLINECOUNTER: Value { .init(rawValue: ICAL_XLICCLASS_DECLINECOUNTER) }
        /// ICAL_XLICCLASS_MALFORMED
        public static var MALFORMED: Value { .init(rawValue: ICAL_XLICCLASS_MALFORMED) }
        /// ICAL_XLICCLASS_OBSOLETE
        public static var OBSOLETE: Value { .init(rawValue: ICAL_XLICCLASS_OBSOLETE) }
        /// ICAL_XLICCLASS_MISSEQUENCED
        public static var MISSEQUENCED: Value { .init(rawValue: ICAL_XLICCLASS_MISSEQUENCED) }
        /// ICAL_XLICCLASS_UNKNOWN
        public static var UNKNOWN: Value { .init(rawValue: ICAL_XLICCLASS_UNKNOWN) }
        /// ICAL_XLICCLASS_NONE
        public static var NONE: Value { .init(rawValue: ICAL_XLICCLASS_NONE) }

    }
}

extension icalproperty_xlicclass: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_xlicclass {
    
    /// wrap
    /// - Returns: Property.XlicClass.Value
    internal func wrap() -> Property.XlicClass.Value {
        return .init(rawValue: base)
    }
}
