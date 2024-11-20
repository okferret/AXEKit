//
//  Property+XlicClass.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalproperty_xlicclass
extension Property {
    /// icalproperty_xlicclass
    public struct XlicClass: RawRepresentable, Hashable {
        public typealias RawValue = icalproperty_xlicclass
        public let rawValue: icalproperty_xlicclass
        public init(rawValue: icalproperty_xlicclass) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Property.XlicClass {
    /// ICAL_XLICCLASS_X
    public static var X: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_X) }
    /// ICAL_XLICCLASS_PUBLISHNEW
    public static var PUBLISHNEW: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_PUBLISHNEW) }
    /// ICAL_XLICCLASS_PUBLISHUPDATE
    public static var PUBLISHUPDATE: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_PUBLISHUPDATE) }
    /// ICAL_XLICCLASS_PUBLISHFREEBUSY
    public static var PUBLISHFREEBUSY: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_PUBLISHFREEBUSY) }
    /// ICAL_XLICCLASS_REQUESTNEW
    public static var REQUESTNEW: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REQUESTNEW) }
    /// ICAL_XLICCLASS_REQUESTUPDATE
    public static var REQUESTUPDATE: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REQUESTUPDATE) }
    /// ICAL_XLICCLASS_REQUESTRESCHEDULE
    public static var REQUESTRESCHEDULE: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REQUESTRESCHEDULE) }
    /// ICAL_XLICCLASS_REQUESTDELEGATE
    public static var REQUESTDELEGATE: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REQUESTDELEGATE) }
    /// ICAL_XLICCLASS_REQUESTNEWORGANIZER
    public static var REQUESTNEWORGANIZER: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REQUESTNEWORGANIZER) }
    /// ICAL_XLICCLASS_REQUESTFORWARD
    public static var REQUESTFORWARD: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REQUESTFORWARD) }
    /// ICAL_XLICCLASS_REQUESTSTATUS
    public static var REQUESTSTATUS: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REQUESTSTATUS) }
    /// ICAL_XLICCLASS_REQUESTFREEBUSY
    public static var REQUESTFREEBUSY: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REQUESTFREEBUSY) }
    /// ICAL_XLICCLASS_REPLYACCEPT
    public static var REPLYACCEPT: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REPLYACCEPT) }
    /// ICAL_XLICCLASS_REPLYDECLINE
    public static var REPLYDECLINE: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REPLYDECLINE) }
    /// ICAL_XLICCLASS_REPLYDELEGATE
    public static var REPLYDELEGATE: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REPLYDELEGATE) }
    /// ICAL_XLICCLASS_REPLYCRASHERACCEPT
    public static var REPLYCRASHERACCEPT: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REPLYCRASHERACCEPT) }
    /// ICAL_XLICCLASS_REPLYCRASHERDECLINE
    public static var REPLYCRASHERDECLINE: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REPLYCRASHERDECLINE) }
    /// ICAL_XLICCLASS_ADDINSTANCE
    public static var ADDINSTANCE: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_ADDINSTANCE) }
    /// ICAL_XLICCLASS_CANCELEVENT
    public static var CANCELEVENT: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_CANCELEVENT) }
    /// ICAL_XLICCLASS_CANCELINSTANCE
    public static var CANCELINSTANCE: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_CANCELINSTANCE) }
    /// ICAL_XLICCLASS_CANCELALL
    public static var CANCELALL: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_CANCELALL) }
    /// ICAL_XLICCLASS_REFRESH
    public static var REFRESH: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_REFRESH) }
    /// ICAL_XLICCLASS_COUNTER
    public static var COUNTER: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_COUNTER) }
    /// ICAL_XLICCLASS_DECLINECOUNTER
    public static var DECLINECOUNTER: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_DECLINECOUNTER) }
    /// ICAL_XLICCLASS_MALFORMED
    public static var MALFORMED: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_MALFORMED) }
    /// ICAL_XLICCLASS_OBSOLETE
    public static var OBSOLETE: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_OBSOLETE) }
    /// ICAL_XLICCLASS_MISSEQUENCED
    public static var MISSEQUENCED: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_MISSEQUENCED) }
    /// ICAL_XLICCLASS_UNKNOWN
    public static var UNKNOWN: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_UNKNOWN) }
    /// ICAL_XLICCLASS_NONE
    public static var NONE: Property.XlicClass { .init(rawValue: ICAL_XLICCLASS_NONE) }
}

extension icalproperty_xlicclass: CompatibleValue {}
extension CompatibleWrapper where Base == icalproperty_xlicclass {
    /// wrap
    /// - Returns: Property.XlicClass
    internal func wrap() -> Property.XlicClass {
        return .init(rawValue: base)
    }
}
