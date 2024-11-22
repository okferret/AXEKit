//
//  Parameter.swift
//  AXEKit
//
//  Created by okferret on 2024/11/15.
//

import libical
import Foundation

public class Parameter: NSObject {
    
    // MARK: - 公开属性
    
    /// Kind
    public let kind: Kind
    /// String
    public override var description: String {
        if let newText = icalparameter_as_ical_string(rawValue) {
            return .init(cString: newText)
        } else {
            return super.description
        }
    }
    
    // MARK: - 私有属性
    
    /// icalparameter
    internal let rawValue: icalparameter
    
    // MARK: - 生命周期
    
    /// 构建
    /// - Parameter rawValue: icalparameter
    internal init(rawValue: icalparameter) {
        self.rawValue = rawValue
        self.kind = .init(rawValue: icalparameter_isa(rawValue))
        super.init()
    }
    
    /// 构建
    /// - Parameter kind: Kind
    public convenience init(kind: Kind) {
        self.init(rawValue: icalparameter_new(kind.rawValue))
    }
    
    /// 构建
    /// - Parameter parameter: Parameter
    public convenience init(parameter: Parameter) {
        self.init(rawValue: icalparameter_new_clone(parameter.rawValue))
    }
    
    deinit {
        icalparameter_free(rawValue)
    }
}

extension Parameter {
    
    /// rfc5545
    /// - Returns: String
    public func rfc5545() -> String {
        if let value = icalparameter_as_ical_string(rawValue) {
            return .init(cString: value)
        } else {
            return ""
        }
    }
}

extension Parameter {
    
    /// from element
    /// - Parameter element: icalparameter
    /// - Returns: Parameter
    internal static func from(_ element: icalparameter) -> Parameter {
        switch icalparameter_isa(element).hub.wrap() {
        case .ANY:                  return Parameter(rawValue: element)
        case .ACTIONPARAM:          return ParamAction(rawValue: element)
        case .ALTREP:               return ParamAltrep(rawValue: element)
        case .CHARSET:              return ParamCharset(rawValue: element)
        case .CN:                   return ParamCN(rawValue: element)
        case .CUTYPE:               return ParamCutype(rawValue: element)
        case .DELEGATEDFROM:        return ParamDelegatedFrom(rawValue: element)
        case .DELEGATEDTO:          return ParamDelegatedTo(rawValue: element)
        case .DIR:                  return ParamDir(rawValue: element)
        case .DISPLAY:              return ParamDisplay(rawValue: element)
        case .EMAIL:                return ParamEmail(rawValue: element)
        case .ENABLE:               return ParamEnable(rawValue: element)
        case .ENCODING:             return ParamEncoding(rawValue: element)
        case .FBTYPE:               return ParamFbtype(rawValue: element)
        case .FEATURE:              return ParamFeature(rawValue: element)
        case .FILENAME:             return ParamFilename(rawValue: element)
        case .FMTTYPE:              return ParamFmtType(rawValue: element)
        case .IANA:                 return ParamIana(rawValue: element)
        case .ID:                   return ParamID(rawValue: element)
        case .LABEL:                return ParamLabel(rawValue: element)
        case .LANGUAGE:             return ParamLanguage(rawValue: element)
        case .LATENCY:              return ParamLatency(rawValue: element)
        case .LOCAL:                return ParamLocal(rawValue: element)
        case .LOCALIZE:             return ParamLocalize(rawValue: element)
        case .MANAGEDID:            return ParamManagedID(rawValue: element)
        case .MEMBER:               return ParamMember(rawValue: element)
        case .MODIFIED:             return ParamModified(rawValue: element)
        case .OPTIONS:              return ParamOptions(rawValue: element)
        case .PARTSTAT:             return ParamPartstat(rawValue: element)
        case .PATCHACTION:          return ParamPatchAction(rawValue: element)
        case .PUBLICCOMMENT:        return ParamPublicComment(rawValue: element)
        case .RANGE:                return ParamRange(rawValue: element)
        case .REASON:               return ParamReason(rawValue: element)
        case .RELATED:              return ParamRelated(rawValue: element)
        case .RELTYPE:              return ParamReltype(rawValue: element)
        case .REQUIRED:             return ParamRequired(rawValue: element)
        case .RESPONSE:             return ParamResponse(rawValue: element)
        case .ROLE:                 return ParamRole(rawValue: element)
        case .RSVP:                 return ParamRSVP(rawValue: element)
        case .SCHEDULEAGENT:        return ParamScheduleAgent(rawValue: element)
        case .SCHEDULEFORCESEND:    return ParamScheduleForceSend(rawValue: element)
        case .SCHEDULESTATUS:       return ParamScheduleStatus(rawValue: element)
        case .SENTBY:               return ParamSentBy(rawValue: element)
        case .SIZE:                 return ParamSize(rawValue: element)
        case .STAYINFORMED:         return ParamStayInformed(rawValue: element)
        case .SUBSTATE:             return ParamSubstate(rawValue: element)
        case .TZID:                 return ParamTZID(rawValue: element)
        case .VALUE:                return ParamValue(rawValue: element)
        case .X:                    return ParamX(rawValue: element)
        case .XLICCOMPARETYPE:      return ParamXlicCompareType(rawValue: element)
        case .XLICERRORTYPE:        return ParamXlicErrorType(rawValue: element)
        default:                    return Parameter(rawValue: element)
        }
    }
}
