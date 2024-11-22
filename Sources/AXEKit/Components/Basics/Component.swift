//
//  Component.swift
//  AXEKit
//
//  Created by okferret on 2024/11/15.
//

import libical
import Foundation

/// Component
public class Component: NSObject {
    
    // MARK: - 公开属性
    
    /// Kind
    public let kind: Kind
    /// Array<Component>
    public private(set) var components: Array<Component>
    /// Array<Property>
    public private(set) var properties: Array<Property>
    /// description
    public override var description: String {
        if let value = icalcomponent_as_ical_string(rawValue) {
            return .init(cString: value)
        } else {
            return super.description
        }
    }
    
    // MARK: - 私有属性
    
    /// icalcomponent
    internal let rawValue: icalcomponent
    
    // MARK: - 生命周期
    
    /// 构建
    /// - Parameter rawValue: icalcomponent
    internal init(rawValue: icalcomponent) {
        self.rawValue = rawValue
        self.kind = .init(rawValue: icalcomponent_isa(rawValue))
        self.components = Set(Component.Kind.allCases).subtracting([.ANY]).reduce([]) { $0 + icalcomponent_get_components(from: rawValue, kind: $1.rawValue) }.map { .from($0) }
        self.properties = Set(Property.Kind.allCases).subtracting([.ANY]).reduce([]) { $0 + icalcomponent_get_properties(from: rawValue, kind: $1.rawValue) }.map { .from($0) }
        super.init()
    }
    
    /// 构建
    /// - Parameter rfc5545: String
    internal convenience init(rfc5545: String) throws {
        if let cmpt: icalcomponent = icalcomponent_new_from_string(rfc5545) {
            self.init(rawValue: cmpt)
        } else {
            throw AXError.custom("rfc5545 解析失败")
        }
    }
    
    /// 构建
    /// - Parameter component: Component
    public convenience init(component: Component) {
        self.init(rawValue: component.rawValue)
    }
    
    /// 构建
    /// - Parameter kind: Kind
    public convenience init(kind: Kind) {
        self.init(rawValue: icalcomponent_new(kind.rawValue))
    }
    
    deinit {
        icalcomponent_free(rawValue)
    }
}

extension Component {
    
    /// rfc5545
    /// - Returns: String
    public func rfc5545() -> String {
        if let value = icalcomponent_as_ical_string(rawValue) {
            return .init(cString: value)
        } else {
            return ""
        }
    }
    
    /// add property
    /// - Parameter property: Property
    public func add(_ property: Property) {
        icalcomponent_add_property(rawValue, property.rawValue)
    }
    
    /// remove property
    /// - Parameter property: Property
    public func remove(_ property: Property) {
        icalcomponent_remove_property(rawValue, property.rawValue)
    }
    
    /// count for kind
    /// - Parameter kind: Property.Kind
    /// - Returns: Int
    public func count(for kind: Property.Kind) -> Int {
        return Int(icalcomponent_count_properties(rawValue, kind.rawValue))
    }
    
    /// add component
    /// - Parameter component: Component
    public func add(_ component: Component) {
        icalcomponent_add_component(rawValue, component.rawValue)
    }
    /// remove componnet
    /// - Parameter componnet: Component
    public func remove(_ componnet: Component) {
        icalcomponent_remove_component(rawValue, componnet.rawValue)
    }
    
    /// count for kind
    /// - Parameter kind: Component.Kind
    /// - Returns: Int
    public func count(for kind: Component.Kind) -> Int {
        return Int(icalcomponent_count_components(rawValue, kind.rawValue))
    }
    
    /// merge component
    /// - Parameter component: Component
    public func merge(_ component: Component) {
        icalcomponent_merge_component(rawValue, component.rawValue)
    }
 
}

extension Component {
    
    /// from cmpt
    /// - Parameter cmpt: icalcomponent
    /// - Returns: Component
    internal static func from(_ cmpt: icalcomponent) -> Component {
        switch icalcomponent_isa(cmpt).hub.wrap() {
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
