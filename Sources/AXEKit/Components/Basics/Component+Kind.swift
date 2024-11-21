//
//  Component+Kind.swift
//  AXEKit
//
//  Created by okferret on 2024/11/15.
//

import libical

extension Component {
    /// icalcomponent_kind
    public struct Kind: RawRepresentable, Hashable {
        public typealias RawValue = icalcomponent_kind
        public let rawValue: icalcomponent_kind
        public init(rawValue: icalcomponent_kind) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Component.Kind {
    /// ICAL_NO_COMPONENT
    public static var NO: Component.Kind { .init(rawValue: ICAL_NO_COMPONENT) }
    /// ICAL_ANY_COMPONENT
    public static var ANY: Component.Kind { .init(rawValue: ICAL_ANY_COMPONENT) }
    /// ICAL_XROOT_COMPONENT
    public static var XROOT: Component.Kind { .init(rawValue: ICAL_XROOT_COMPONENT) }
    /// ICAL_XATTACH_COMPONENT
    public static var XATTACH: Component.Kind { .init(rawValue: ICAL_XATTACH_COMPONENT) }
    /// ICAL_VEVENT_COMPONENT
    public static var VEVENT: Component.Kind { .init(rawValue: ICAL_VEVENT_COMPONENT) }
    /// ICAL_VTODO_COMPONENT
    public static var VTODO: Component.Kind { .init(rawValue: ICAL_VTODO_COMPONENT) }
    /// ICAL_VJOURNAL_COMPONENT
    public static var VJOURNAL: Component.Kind { .init(rawValue: ICAL_VJOURNAL_COMPONENT) }
    /// ICAL_VCALENDAR_COMPONENT
    public static var VCALENDAR: Component.Kind { .init(rawValue: ICAL_VCALENDAR_COMPONENT) }
    /// ICAL_VAGENDA_COMPONENT
    public static var VAGENDA: Component.Kind { .init(rawValue: ICAL_VAGENDA_COMPONENT) }
    /// ICAL_VFREEBUSY_COMPONENT
    public static var VFREEBUSY: Component.Kind { .init(rawValue: ICAL_VFREEBUSY_COMPONENT) }
    /// ICAL_VALARM_COMPONENT
    public static var VALARM: Component.Kind { .init(rawValue: ICAL_VALARM_COMPONENT) }
    /// ICAL_XAUDIOALARM_COMPONENT
    public static var XAUDIOALARM: Component.Kind { .init(rawValue: ICAL_XAUDIOALARM_COMPONENT) }
    /// ICAL_XDISPLAYALARM_COMPONENT
    public static var XDISPLAYALARM: Component.Kind { .init(rawValue: ICAL_XDISPLAYALARM_COMPONENT) }
    /// ICAL_XEMAILALARM_COMPONENT
    public static var XEMAILALARM: Component.Kind { .init(rawValue: ICAL_XEMAILALARM_COMPONENT) }
    /// ICAL_XPROCEDUREALARM_COMPONENT
    public static var XPROCEDUREALARM: Component.Kind { .init(rawValue: ICAL_XPROCEDUREALARM_COMPONENT) }
    /// ICAL_VTIMEZONE_COMPONENT
    public static var VTIMEZONE: Component.Kind { .init(rawValue: ICAL_VTIMEZONE_COMPONENT) }
    /// ICAL_XSTANDARD_COMPONENT
    public static var XSTANDARD: Component.Kind { .init(rawValue: ICAL_XSTANDARD_COMPONENT) }
    /// ICAL_XDAYLIGHT_COMPONENT
    public static var XDAYLIGHT: Component.Kind { .init(rawValue: ICAL_XDAYLIGHT_COMPONENT) }
    /// ICAL_X_COMPONENT
    public static var X: Component.Kind { .init(rawValue: ICAL_X_COMPONENT) }
    /// ICAL_VSCHEDULE_COMPONENT
    public static var VSCHEDULE: Component.Kind { .init(rawValue: ICAL_VSCHEDULE_COMPONENT) }
    /// ICAL_VQUERY_COMPONENT
    public static var VQUERY: Component.Kind { .init(rawValue: ICAL_VQUERY_COMPONENT) }
    /// ICAL_VREPLY_COMPONENT
    public static var VREPLY: Component.Kind { .init(rawValue: ICAL_VREPLY_COMPONENT) }
    /// ICAL_VCAR_COMPONENT
    public static var VCAR: Component.Kind { .init(rawValue: ICAL_VCAR_COMPONENT) }
    /// ICAL_VCOMMAND_COMPONENT
    public static var VCOMMAND: Component.Kind { .init(rawValue: ICAL_VCOMMAND_COMPONENT) }
    /// ICAL_XLICINVALID_COMPONENT
    public static var XLICINVALID: Component.Kind { .init(rawValue: ICAL_XLICINVALID_COMPONENT) }
    /// ICAL_XLICMIMEPART_COMPONENT
    public static var XLICMIMEPART: Component.Kind { .init(rawValue: ICAL_XLICMIMEPART_COMPONENT) }
    /// ICAL_VAVAILABILITY_COMPONENT
    public static var VAVAILABILITY: Component.Kind { .init(rawValue: ICAL_VAVAILABILITY_COMPONENT) }
    /// ICAL_XAVAILABLE_COMPONENT
    public static var XAVAILABLE: Component.Kind { .init(rawValue: ICAL_XAVAILABLE_COMPONENT) }
    /// ICAL_VPOLL_COMPONENT
    public static var VPOLL: Component.Kind { .init(rawValue: ICAL_VPOLL_COMPONENT) }
    /// ICAL_VVOTER_COMPONENT
    public static var VVOTER: Component.Kind { .init(rawValue: ICAL_VVOTER_COMPONENT) }
    /// ICAL_XVOTE_COMPONENT
    public static var XVOTE: Component.Kind { .init(rawValue: ICAL_XVOTE_COMPONENT) }
    /// ICAL_VPATCH_COMPONENT
    public static var VPATCH: Component.Kind { .init(rawValue: ICAL_VPATCH_COMPONENT) }
    /// ICAL_XPATCH_COMPONENT
    public static var XPATCH: Component.Kind { .init(rawValue: ICAL_XPATCH_COMPONENT) }
    
    /// Array<Component.Kind>
    public static var allCases: Array<Component.Kind> {
        return [NO, ANY, XROOT, XATTACH, VEVENT, VTODO, VJOURNAL, VCALENDAR, VAGENDA, VFREEBUSY, VALARM, XAUDIOALARM, XDISPLAYALARM,
                XEMAILALARM, XPROCEDUREALARM, VTIMEZONE, XSTANDARD, XDAYLIGHT, X, VSCHEDULE, VQUERY, VREPLY, VCAR, VCOMMAND, XLICINVALID,
                XLICMIMEPART, VAVAILABILITY, XAVAILABLE, VPOLL, VVOTER, XVOTE, VPATCH, XPATCH]
    }
}

extension icalcomponent_kind: CompatibleValue {}
extension CompatibleWrapper where Base == icalcomponent_kind {
    /// wrap
    /// - Returns: Component.Kind
    internal func wrap() -> Component.Kind {
        return .init(rawValue: base)
    }
}

extension Component {
    
    /// from cmpt
    /// - Parameter cmpt: icalcomponent
    /// - Returns: Component
    internal static func from(_ cmpt: icalcomponent) -> Component {
        switch icalcomponent_isa(cmpt).hub.wrap() {
        case .NO:               return Component(rawValue: cmpt)
        case .ANY:              return Component(rawValue: cmpt)
        case .XROOT:            return Component(rawValue: cmpt)
        case .XATTACH:          return Component(rawValue: cmpt)
        case .VEVENT:           return VEvent(rawValue: cmpt)
        case .VTODO:            return VTodo(rawValue: cmpt)
        case .VJOURNAL:         return VJournal(rawValue: cmpt)
        case .VCALENDAR:        return VCalendar(rawValue: cmpt)
        case .VAGENDA:          return VAgenda(rawValue: cmpt)
        case .VFREEBUSY:        return VFreeBusy(rawValue: cmpt)
        case .VALARM:           return VAlarm(rawValue: cmpt)
        case .XAUDIOALARM:      return Component(rawValue: cmpt)
        case .XDISPLAYALARM:    return Component(rawValue: cmpt)
        case .XEMAILALARM:      return Component(rawValue: cmpt)
        case .XPROCEDUREALARM:  return Component(rawValue: cmpt)
        case .VTIMEZONE:        return VTimeZone(rawValue: cmpt)
        case .XSTANDARD:        return XStandard(rawValue: cmpt)
        case .XDAYLIGHT:        return XDaylight(rawValue: cmpt)
        case .X:                return Component(rawValue: cmpt)
        case .VSCHEDULE:        return Component(rawValue: cmpt)
        case .VQUERY:           return VQuery(rawValue: cmpt)
        case .VREPLY:           return Component(rawValue: cmpt)
        case .VCAR:             return Component(rawValue: cmpt)
        case .VCOMMAND:         return Component(rawValue: cmpt)
        case .XLICINVALID:      return Component(rawValue: cmpt)
        case .XLICMIMEPART:     return Component(rawValue: cmpt)
        case .VAVAILABILITY:    return VAvailability(rawValue: cmpt)
        case .XAVAILABLE:       return XAvailable(rawValue: cmpt)
        case .VPOLL:            return VPoll(rawValue: cmpt)
        case .VVOTER:           return VVoter(rawValue: cmpt)
        case .XVOTE:            return XVote(rawValue: cmpt)
        case .VPATCH:           return VPatch(rawValue: cmpt)
        case .XPATCH:           return XPatch(rawValue: cmpt)
        default:                return Component(rawValue: cmpt)
        }
    }
}
