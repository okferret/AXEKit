//
//  Value.swift
//  AXEKit
//
//  Created by okferret on 2024/11/15.
//

import Foundation
import libical

/// Value
public class Value: NSObject {
    
    // MARK: - 公开属性
    
    /// Kind
    public var kind: Kind {
        return .init(rawValue: icalvalue_isa(rawValue))
    }
    /// String
    public override var description: String {
        if let newValue = icalvalue_as_ical_string(rawValue) {
            return .init(cString: newValue)
        } else {
            return super.description
        }
    }
    
    // MARK: - 私有属性
    
    /// icalvalue
    internal let rawValue: icalvalue
    
    // MARK: - 生命周期
    
    /// 构建
    /// - Parameter rawValue: icalvalue
    internal init(rawValue: icalvalue) {
        self.rawValue = rawValue
        super.init()
    }
    
    /// 构建
    /// - Parameter kind: Kind
    public convenience init(kind: Kind) {
        self.init(rawValue: icalvalue_new(kind.rawValue))
    }
    
    /// 构建
    /// - Parameter value: Value
    public convenience init(value: Value) {
        self.init(rawValue: icalvalue_new_clone(value.rawValue))
    }
    
    deinit {
        icalvalue_free(rawValue)
    }
}

extension Value {
    
    // rfc5545
    /// - Returns: String
    internal func rfc5545() -> String {
        if let value = icalvalue_as_ical_string(rawValue) {
            return .init(cString: value)
        } else {
            return ""
        }
    }
    
    /// value
    /// - Parameter kind: Kind
    /// - Returns: Optional<Any>
    internal func value(forKind kind: Kind) -> Optional<Any> {
        switch kind {
        case .ANY:              return icalvalue_get_string(rawValue).hub.wrap()
        case .ACTION:           return icalvalue_get_action(rawValue).hub.wrap()
        case .ATTACH:           return icalvalue_get_string(rawValue).hub.wrap()
        case .BINARY:           return icalvalue_get_binary(rawValue).hub.wrap()
        case .BOOLEAN:          return icalvalue_get_boolean(rawValue) > 0
        case .BUSYTYPE:         return icalvalue_get_busytype(rawValue).hub.wrap()
        case .CALADDRESS:       return icalvalue_get_caladdress(rawValue).hub.wrap()
        case .CARLEVEL:         return icalvalue_get_carlevel(rawValue).hub.wrap()
        case .CLASS:            return icalvalue_get_class(rawValue).hub.wrap()
        case .CMD:              return icalvalue_get_cmd(rawValue).hub.wrap()
        case .DATE:             return icalvalue_get_date(rawValue).hub.wrap()
        case .DATETIME:         return icalvalue_get_datetime(rawValue).hub.wrap()
        case .DATETIMEDATE:     return icalvalue_get_datetimedate(rawValue).hub.wrap()
        case .DATETIMEPERIOD:   return icalvalue_get_datetimeperiod(rawValue)
        case .DURATION:         return icalvalue_get_duration(rawValue)
        case .FLOAT:            return icalvalue_get_float(rawValue)
        case .GEO:              return icalvalue_get_geo(rawValue).hub.wrap()
        case .INTEGER:          return icalvalue_get_integer(rawValue)
        case .METHOD:           return icalvalue_get_method(rawValue).hub.wrap()
        case .PERIOD:           return icalvalue_get_period(rawValue)
        case .POLLCOMPLETION:   return icalvalue_get_pollcompletion(rawValue).hub.wrap()
        case .POLLMODE:         return icalvalue_get_pollmode(rawValue).hub.wrap()
        case .QUERY:            return icalvalue_get_query(rawValue).hub.wrap()
        case .QUERYLEVEL:       return icalvalue_get_querylevel(rawValue).hub.wrap()
        case .RECUR:            return icalvalue_get_recur(rawValue)
        case .REQUESTSTATUS:    return icalvalue_get_requeststatus(rawValue)
        case .STATUS:           return icalvalue_get_status(rawValue).hub.wrap()
        case .STRING:           return icalvalue_get_string(rawValue).hub.wrap()
        case .TASKMODE:         return icalvalue_get_taskmode(rawValue).hub.wrap()
        case .TEXT:             return icalvalue_get_text(rawValue).hub.wrap()
        case .TRANSP:           return icalvalue_get_transp(rawValue).hub.wrap()
        case .TRIGGER:          return icalvalue_get_trigger(rawValue)
        case .URI:              return icalvalue_get_uri(rawValue).hub.wrap()
        case .UTCOFFSET:        return icalvalue_get_utcoffset(rawValue)
        case .X:                return icalvalue_get_x(rawValue).hub.wrap()
        case .XLICCLASS:        return icalvalue_get_xlicclass(rawValue).hub.wrap()
        case .NO:               return .none
        default:                return .none
        }
    }
    
    /// value forKind
    /// - Parameter kind: Kind
    /// - Returns: Optional<T>
    internal func value<T>() -> Optional<T> {
        return value(forKind: kind) as? T
    }
}
