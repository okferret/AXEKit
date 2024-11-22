//
//  Parameter+Kind.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

// MARK: - icalparameter_kind
extension Parameter {
    /// icalparameter_kind
    public struct Kind: RawRepresentable, Hashable {
        public typealias RawValue = icalparameter_kind
        public let rawValue: icalparameter_kind
        public init(rawValue: icalparameter_kind) {
            self.rawValue = rawValue
        }
        public func hash(into hasher: inout Hasher) {
            hasher.combine(rawValue.rawValue)
        }
    }
}

extension Parameter.Kind {
    /// ICAL_ANY_PARAMETER
    public static var ANY: Parameter.Kind { .init(rawValue: ICAL_ANY_PARAMETER) }
    /// ICAL_ACTIONPARAM_PARAMETER
    public static var ACTIONPARAM: Parameter.Kind { .init(rawValue: ICAL_ACTIONPARAM_PARAMETER) }
    /// ICAL_ALTREP_PARAMETER
    public static var ALTREP: Parameter.Kind { .init(rawValue: ICAL_ALTREP_PARAMETER) }
    /// ICAL_CHARSET_PARAMETER
    public static var CHARSET: Parameter.Kind { .init(rawValue: ICAL_CHARSET_PARAMETER) }
    /// ICAL_CN_PARAMETER
    public static var CN: Parameter.Kind { .init(rawValue: ICAL_CN_PARAMETER) }
    /// ICAL_CUTYPE_PARAMETER
    public static var CUTYPE: Parameter.Kind { .init(rawValue: ICAL_CUTYPE_PARAMETER) }
    /// ICAL_DELEGATEDFROM_PARAMETER
    public static var DELEGATEDFROM: Parameter.Kind { .init(rawValue: ICAL_DELEGATEDFROM_PARAMETER) }
    /// ICAL_DELEGATEDTO_PARAMETER
    public static var DELEGATEDTO: Parameter.Kind { .init(rawValue: ICAL_DELEGATEDTO_PARAMETER) }
    /// ICAL_DIR_PARAMETER
    public static var DIR: Parameter.Kind { .init(rawValue: ICAL_DIR_PARAMETER) }
    /// ICAL_DISPLAY_PARAMETER
    public static var DISPLAY: Parameter.Kind { .init(rawValue: ICAL_DISPLAY_PARAMETER) }
    /// ICAL_EMAIL_PARAMETER
    public static var EMAIL: Parameter.Kind { .init(rawValue: ICAL_EMAIL_PARAMETER) }
    /// ICAL_ENABLE_PARAMETER
    public static var ENABLE: Parameter.Kind { .init(rawValue: ICAL_ENABLE_PARAMETER) }
    /// ICAL_ENCODING_PARAMETER
    public static var ENCODING: Parameter.Kind { .init(rawValue: ICAL_ENCODING_PARAMETER) }
    /// ICAL_FBTYPE_PARAMETER
    public static var FBTYPE: Parameter.Kind { .init(rawValue: ICAL_FBTYPE_PARAMETER) }
    /// ICAL_FEATURE_PARAMETER
    public static var FEATURE: Parameter.Kind { .init(rawValue: ICAL_FEATURE_PARAMETER) }
    /// ICAL_FILENAME_PARAMETER
    public static var FILENAME: Parameter.Kind { .init(rawValue: ICAL_FILENAME_PARAMETER) }
    /// ICAL_FMTTYPE_PARAMETER
    public static var FMTTYPE: Parameter.Kind { .init(rawValue: ICAL_FMTTYPE_PARAMETER) }
    /// ICAL_IANA_PARAMETER
    public static var IANA: Parameter.Kind { .init(rawValue: ICAL_IANA_PARAMETER) }
    /// ICAL_ID_PARAMETER
    public static var ID: Parameter.Kind { .init(rawValue: ICAL_ID_PARAMETER) }
    /// ICAL_LABEL_PARAMETER
    public static var LABEL: Parameter.Kind { .init(rawValue: ICAL_LABEL_PARAMETER) }
    /// ICAL_LANGUAGE_PARAMETER
    public static var LANGUAGE: Parameter.Kind { .init(rawValue: ICAL_LANGUAGE_PARAMETER) }
    /// ICAL_LATENCY_PARAMETER
    public static var LATENCY: Parameter.Kind { .init(rawValue: ICAL_LATENCY_PARAMETER) }
    /// ICAL_LOCAL_PARAMETER
    public static var LOCAL: Parameter.Kind { .init(rawValue: ICAL_LOCAL_PARAMETER) }
    /// ICAL_LOCALIZE_PARAMETER
    public static var LOCALIZE: Parameter.Kind { .init(rawValue: ICAL_LOCALIZE_PARAMETER) }
    /// ICAL_MANAGEDID_PARAMETER
    public static var MANAGEDID: Parameter.Kind { .init(rawValue: ICAL_MANAGEDID_PARAMETER) }
    /// ICAL_MEMBER_PARAMETER
    public static var MEMBER: Parameter.Kind { .init(rawValue: ICAL_MEMBER_PARAMETER) }
    /// ICAL_MODIFIED_PARAMETER
    public static var MODIFIED: Parameter.Kind { .init(rawValue: ICAL_MODIFIED_PARAMETER) }
    /// ICAL_OPTIONS_PARAMETER
    public static var OPTIONS: Parameter.Kind { .init(rawValue: ICAL_OPTIONS_PARAMETER) }
    /// ICAL_PARTSTAT_PARAMETER
    public static var PARTSTAT: Parameter.Kind { .init(rawValue: ICAL_PARTSTAT_PARAMETER) }
    /// ICAL_PATCHACTION_PARAMETER
    public static var PATCHACTION: Parameter.Kind { .init(rawValue: ICAL_PATCHACTION_PARAMETER) }
    /// ICAL_PUBLICCOMMENT_PARAMETER
    public static var PUBLICCOMMENT: Parameter.Kind { .init(rawValue: ICAL_PUBLICCOMMENT_PARAMETER) }
    /// ICAL_RANGE_PARAMETER
    public static var RANGE: Parameter.Kind { .init(rawValue: ICAL_RANGE_PARAMETER) }
    /// ICAL_REASON_PARAMETER
    public static var REASON: Parameter.Kind { .init(rawValue: ICAL_REASON_PARAMETER) }
    /// ICAL_RELATED_PARAMETER
    public static var RELATED: Parameter.Kind { .init(rawValue: ICAL_RELATED_PARAMETER) }
    /// ICAL_RELTYPE_PARAMETER
    public static var RELTYPE: Parameter.Kind { .init(rawValue: ICAL_RELTYPE_PARAMETER) }
    /// ICAL_REQUIRED_PARAMETER
    public static var REQUIRED: Parameter.Kind { .init(rawValue: ICAL_REQUIRED_PARAMETER) }
    /// ICAL_RESPONSE_PARAMETER
    public static var RESPONSE: Parameter.Kind { .init(rawValue: ICAL_RESPONSE_PARAMETER) }
    /// ICAL_ROLE_PARAMETER
    public static var ROLE: Parameter.Kind { .init(rawValue: ICAL_ROLE_PARAMETER) }
    /// ICAL_RSVP_PARAMETER
    public static var RSVP: Parameter.Kind { .init(rawValue: ICAL_RSVP_PARAMETER) }
    /// ICAL_SCHEDULEAGENT_PARAMETER
    public static var SCHEDULEAGENT: Parameter.Kind { .init(rawValue: ICAL_SCHEDULEAGENT_PARAMETER) }
    /// ICAL_SCHEDULEFORCESEND_PARAMETER
    public static var SCHEDULEFORCESEND: Parameter.Kind { .init(rawValue: ICAL_SCHEDULEFORCESEND_PARAMETER) }
    /// ICAL_SCHEDULESTATUS_PARAMETER
    public static var SCHEDULESTATUS: Parameter.Kind { .init(rawValue: ICAL_SCHEDULESTATUS_PARAMETER) }
    /// ICAL_SENTBY_PARAMETER
    public static var SENTBY: Parameter.Kind { .init(rawValue: ICAL_SENTBY_PARAMETER) }
    /// ICAL_SIZE_PARAMETER
    public static var SIZE: Parameter.Kind { .init(rawValue: ICAL_SIZE_PARAMETER) }
    /// ICAL_STAYINFORMED_PARAMETER
    public static var STAYINFORMED: Parameter.Kind { .init(rawValue: ICAL_STAYINFORMED_PARAMETER) }
    /// ICAL_SUBSTATE_PARAMETER
    public static var SUBSTATE: Parameter.Kind { .init(rawValue: ICAL_SUBSTATE_PARAMETER) }
    /// ICAL_TZID_PARAMETER
    public static var TZID: Parameter.Kind { .init(rawValue: ICAL_TZID_PARAMETER) }
    /// ICAL_VALUE_PARAMETER
    public static var VALUE: Parameter.Kind { .init(rawValue: ICAL_VALUE_PARAMETER) }
    /// ICAL_X_PARAMETER
    public static var X: Parameter.Kind { .init(rawValue: ICAL_X_PARAMETER) }
    /// ICAL_XLICCOMPARETYPE_PARAMETER
    public static var XLICCOMPARETYPE: Parameter.Kind { .init(rawValue: ICAL_XLICCOMPARETYPE_PARAMETER) }
    /// ICAL_XLICERRORTYPE_PARAMETER
    public static var XLICERRORTYPE: Parameter.Kind { .init(rawValue: ICAL_XLICERRORTYPE_PARAMETER) }
    
    /// [Parameter.Kind]
    public static var allCases: Array<Parameter.Kind> {
        return [ANY, ACTIONPARAM, ALTREP, CHARSET, CN, CUTYPE, DELEGATEDFROM, DELEGATEDTO, DIR, DISPLAY, EMAIL, ENABLE, ENCODING, FBTYPE,
            FEATURE, FILENAME, FMTTYPE, IANA, ID, LABEL, LANGUAGE, LATENCY, LOCAL, LOCALIZE, MANAGEDID, MEMBER, MODIFIED, OPTIONS, PARTSTAT,
            PATCHACTION, PUBLICCOMMENT, RANGE, REASON, RELATED, RELTYPE, REQUIRED, RESPONSE, ROLE, RSVP, SCHEDULEAGENT, SCHEDULEFORCESEND,
            SCHEDULESTATUS, SENTBY, SIZE, STAYINFORMED, SUBSTATE, TZID, VALUE, X, XLICCOMPARETYPE, XLICERRORTYPE]
    }
}

extension icalparameter_kind: CompatibleValue {}
extension CompatibleWrapper where Base == icalparameter_kind {
    /// wrap
    /// - Returns: Parameter.Kind
    internal func wrap() -> Parameter.Kind {
        return .init(rawValue: base)
    }
}
