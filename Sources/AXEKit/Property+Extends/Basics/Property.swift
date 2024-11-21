//
//  Property.swift
//  AXEKit
//
//  Created by okferret on 2024/11/15.
//

import libical
import Foundation

/// Property
public class Property: NSObject {
    
    // MARK: - 公开属性
    
    /// Kind
    public var kind: Kind {
        return .init(rawValue: icalproperty_isa(rawValue))
    }
    /// Array<Parameter>
    public var parameters: Array<Parameter> {
        return Set(Parameter.Kind.allCases).subtracting([.ANY]).reduce([]) { $0 + icalproperty_get_parameters(from: rawValue, kind: $1.rawValue) }.map { .init(rawValue: $0) }
    }
    /// String
    public override var description: String {
        if let newValue = icalproperty_as_ical_string(rawValue) {
            return .init(cString: newValue)
        } else {
            return super.description
        }
    }
    
    // MARK: - 私有属性
    
    /// icalproperty
    internal let rawValue: icalproperty
    
    // MARK: - 生命周期
    
    /// 构建
    /// - Parameter rawValue: icalproperty
    internal init(rawValue: icalproperty) {
        self.rawValue = rawValue
        super.init()
    }
    
    /// 构建
    /// - Parameter kind: Kind
    public convenience init(kind: Kind) {
        self.init(rawValue: icalproperty_new(kind.rawValue))
    }
    
    /// 构建
    /// - Parameter property: Property
    public convenience init(property: Property) {
        self.init(rawValue: icalproperty_new_clone(property.rawValue))
    }
    
    deinit {
        icalvalue_free(rawValue)
    }
}

extension Property {
    
    // rfc5545
    /// - Returns: String
    public func rfc5545() -> String {
        if let value = icalproperty_as_ical_string(rawValue) {
            return .init(cString: value)
        } else {
            return ""
        }
    }
    
    /// add parameter
    /// - Parameter parameter: Parameter
    public func add(_ parameter: Parameter) {
        icalproperty_add_parameter(rawValue, parameter.rawValue)
    }
    
    /// remove parameter
    /// - Parameter parameter: Parameter
    public func remove(_ parameter: Parameter) {
        icalproperty_remove_parameter_by_ref(rawValue, parameter.rawValue)
    }
    
    /// remove by kind
    /// - Parameter kind: Parameter.Kind
    public func remove(by kind: Parameter.Kind) {
        icalproperty_remove_parameter_by_kind(rawValue, kind.rawValue)
    }
    
    /// remove by name
    /// - Parameter name: String
    public func remove(by name: String) {
        icalproperty_remove_parameter_by_name(rawValue, name)
    }
}

extension Property {
    
    /// from property
    /// - Parameter property: icalproperty
    /// - Returns: Property
    internal static func from(_ property: icalproperty) -> Property {
        switch icalproperty_isa(property).hub.wrap() {
        case . ANY:                 return Property(rawValue: property)
        case .ACCEPTRESPONSE:       return PropAcceptResponse(rawValue: property)
        case .ACKNOWLEDGED:         return PropAcknowledged(rawValue: property)
        case .ACTION:               return PropAction(rawValue: property)
        case .ALLOWCONFLICT:        return PropAllowConflict(rawValue: property)
        case .ATTACH:               return PropAttachment(rawValue: property)
        case .ATTENDEE:             return PropAttendee(rawValue: property)
        case .BUSYTYPE:             return PropBusyType(rawValue: property)
        case .CALID:                return PropCalID(rawValue: property)
        case .CALMASTER:            return PropCalMaster(rawValue: property)
        case .CALSCALE:             return PropCalScale(rawValue: property)
        case .CAPVERSION:           return PropCapVersion(rawValue: property)
        case .CARLEVEL:             return PropCarLevel(rawValue: property)
        case .CARID:                return PropCarID(rawValue: property)
        case .CATEGORIES:           return PropCategories(rawValue: property)
        case .CLASS:                return PropClass(rawValue: property)
        case .CMD:                  return PropCmd(rawValue: property)
        case .COLOR:                return PropColor(rawValue: property)
        case .COMMENT:              return PropComment(rawValue: property)
        case .COMPLETED:            return PropCompleted(rawValue: property)
        case .COMPONENTS:           return PropComponents(rawValue: property)
        case .CONFERENCE:           return PropConference(rawValue: property)
        case .CONTACT:              return PropContact(rawValue: property)
        case .CREATED:              return PropCreated(rawValue: property)
        case .CSID:                 return PropCSID(rawValue: property)
        case .DATEMAX:              return PropDateMax(rawValue: property)
        case .DATEMIN:              return PropDateMin(rawValue: property)
        case .DECREED:              return PropDecreed(rawValue: property)
        case .DEFAULTCHARSET:       return PropDefaultCharset(rawValue: property)
        case .DEFAULTLOCALE:        return PropDefaultLocale(rawValue: property)
        case .DEFAULTTZID:          return PropDefaultTZID(rawValue: property)
        case .DEFAULTVCARS:         return PropDefaultVcars(rawValue: property)
        case .DENY:                 return PropDeny(rawValue: property)
        case .DESCRIPTION:          return PropDescription(rawValue: property)
        case .DTEND:                return PropDtend(rawValue: property)
        case .DTSTAMP:              return PropDtstamp(rawValue: property)
        case .DTSTART:              return PropDtstart(rawValue: property)
        case .DUE:                  return PropDue(rawValue: property)
        case .DURATION:             return PropDuration(rawValue: property)
        case .ESTIMATEDDURATION:    return PropEstimatedDuration(rawValue: property)
        case .EXDATE:               return PropExDate(rawValue: property)
        case .EXPAND:               return PropExpand(rawValue: property)
        case .EXRULE:               return PropExRule(rawValue: property)
        case .FREEBUSY:             return PropFreeBusy(rawValue: property)
        case .GEO:                  return PropGEO(rawValue: property)
        case .GRANT:                return PropGrant(rawValue: property)
        case .IMAGE:                return PropImage(rawValue: property)
        case .ITIPVERSION:          return PropITIPVersion(rawValue: property)
        case .LASTMODIFIED:         return PropLastModified(rawValue: property)
        case .LOCATION:             return PropLocation(rawValue: property)
        case .MAXCOMPONENTSIZE:     return PropMaxComponentSize(rawValue: property)
        case .MAXDATE:              return PropMaxDate(rawValue: property)
        case .MAXRESULTS:           return PropMaxResults(rawValue: property)
        case .MAXRESULTSSIZE:       return PropMaxResultsSize(rawValue: property)
        case .METHOD:               return PropMethod(rawValue: property)
        case .MINDATE:              return PropMinDate(rawValue: property)
        case .MULTIPART:            return PropMultipart(rawValue: property)
        case .NAME:                 return PropName(rawValue: property)
        case .ORGANIZER:            return PropOrganizer(rawValue: property)
        case .OWNER:                return PropOwner(rawValue: property)
        case .PATCHDELETE:          return PropPatchDelete(rawValue: property)
        case .PATCHORDER:           return PropPatchOrder(rawValue: property)
        case .PATCHPARAMETER:       return PropPatchParameter(rawValue: property)
        case .PATCHTARGET:          return PropPatchTarget(rawValue: property)
        case .PATCHVERSION:         return PropPatchVersion(rawValue: property)
        case .PERCENTCOMPLETE:      return PropPercentComplete(rawValue: property)
        case .PERMISSION:           return PropPermission(rawValue: property)
        case .POLLCOMPLETION:       return PropPollCompletion(rawValue: property)
        case .POLLITEMID:           return PropPollItemID(rawValue: property)
        case .POLLMODE:             return PropPollMode(rawValue: property)
        case .POLLPROPERTIES:       return PropPollProperties(rawValue: property)
        case .POLLWINNER:           return PropPollWinner(rawValue: property)
        case .PRIORITY:             return PropPriority(rawValue: property)
        case .PRODID:               return PropProdID(rawValue: property)
        case .QUERY:                return PropQuery(rawValue: property)
        case .QUERYLEVEL:           return PropQueryLevel(rawValue: property)
        case .QUERYID:              return PropQueryID(rawValue: property)
        case .QUERYNAME:            return PropName(rawValue: property)
        case .RDATE:                return PropRdate(rawValue: property)
        case .RECURACCEPTED:        return PropRecurAccepted(rawValue: property)
        case .RECUREXPAND:          return PropRecurExpand(rawValue: property)
        case .RECURLIMIT:           return PropRecurLimit(rawValue: property)
        case .RECURRENCEID:         return PropRecurrenceID(rawValue: property)
        case .REFRESHINTERVAL:      return PropRefreshInterval(rawValue: property)
        case .RELATEDTO:            return PropRelatedTo(rawValue: property)
        case .RELCALID:             return PropRelcalID(rawValue: property)
        case .REPEAT:               return PropRepeat(rawValue: property)
        case .REPLYURL:             return PropReplyURL(rawValue: property)
        case .REQUESTSTATUS:        return PropRequestStatus(rawValue: property)
        case .RESOURCES:            return PropResources(rawValue: property)
        case .RESPONSE:             return PropResponse(rawValue: property)
        case .RESTRICTION:          return PropRestriction(rawValue: property)
        case .RRULE:                return PropRrule(rawValue: property)
        case .SCOPE:                return PropScope(rawValue: property)
        case .SEQUENCE:             return PropSequence(rawValue: property)
        case .SOURCE:               return PropSource(rawValue: property)
        case .STATUS:               return PropStatus(rawValue: property)
        case .STORESEXPANDED:       return PropStoresExpanded(rawValue: property)
        case .SUMMARY:              return PropSummary(rawValue: property)
        case .TARGET:               return PropTarget(rawValue: property)
        case .TASKMODE:             return PropTaskMode(rawValue: property)
        case .TRANSP:               return PropTransp(rawValue: property)
        case .TRIGGER:              return PropTrigger(rawValue: property)
        case .TZID:                 return PropTZID(rawValue: property)
        case .TZIDALIASOF:          return PropTZIDAliasOf(rawValue: property)
        case .TZNAME:               return PropTZName(rawValue: property)
        case .TZOFFSETFROM:         return PropTZOffsetFrom(rawValue: property)
        case .TZOFFSETTO:           return PropTZOffsetTo(rawValue: property)
        case .TZUNTIL:              return PropTZUntil(rawValue: property)
        case .TZURL:                return PropTZURL(rawValue: property)
        case .UID:                  return PropUID(rawValue: property)
        case .URL:                  return PropURL(rawValue: property)
        case .VERSION:              return PropVersion(rawValue: property)
        case .VOTER:                return PropVoter(rawValue: property)
        case .X:                    return PropX(rawValue: property)
        case .XLICCLASS:            return PropXlicClass(rawValue: property)
        case .XLICCLUSTERCOUNT:     return PropXlicClusterCount(rawValue: property)
        case .XLICERROR:            return PropXlicError(rawValue: property)
        case .XLICMIMECHARSET:      return PropXlicMimeCharset(rawValue: property)
        case .XLICMIMECID:          return PropXlicMimeCID(rawValue: property)
        case .XLICMIMECONTENTTYPE:  return PropXlicMimeContentType(rawValue: property)
        case .XLICMIMEENCODING:     return PropXlicMimeEncoding(rawValue: property)
        case .XLICMIMEFILENAME:     return PropXlicMimeFilename(rawValue: property)
        case .XLICMIMEOPTINFO:      return PropXlicMimeOptInfo(rawValue: property)
        default:                    return Property(rawValue: property)
        }
    }
}
