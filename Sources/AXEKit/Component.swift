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
    public var kind: Kind {
        return .init(rawValue: icalcomponent_isa(rawValue))
    }
    /// Array<Component>
    public var components: Array<Component> {
        return Set(Component.Kind.allCases).subtracting([.ANY]).reduce([]) { $0 + icalcomponent_get_components(from: rawValue, kind: $1.rawValue) }.map { .init(rawValue: $0) }
    }
    /// Array<Property>
    public var properties: Array<Property> {
        return Set(Property.Kind.allCases).subtracting([.ANY]).reduce([]) { $0 + icalcomponent_get_properties(from: rawValue, kind: $1.rawValue) }.map { .init(rawValue: $0) }
    }
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
        super.init()
    }
    
    /// 构建
    /// - Parameter rfc5545: String
    public convenience init(rfc5545: String) {
        let cmpt: icalcomponent = icalcomponent_new_from_string(rfc5545)
        self.init(rawValue: cmpt)
    }
    
    /// 构建
    /// - Parameter component: Component
    private convenience init(component: Component) {
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

    /**     @brief Gets the timespan covered by this component, in UTC.
     *
     *      See icalcomponent_foreach_recurrence() for a better way to
     *      extract spans from an component.
     *
     *      This method can be called on either a VCALENDAR or any real
     *      component. If the VCALENDAR contains no real component, but
     *      contains a VTIMEZONE, we return that span instead.
     *      This might not be a desirable behavior; we keep it for now
     *      for backward compatibility, but it might be deprecated at a
     *      future time.
     *
     *      FIXME this API needs to be clarified. DTEND is defined as the
     *      first available time after the end of this event, so the span
     *      should actually end 1 second before DTEND.
     */
    public func span() -> Span {
        let value: icaltime_span = icalcomponent_get_span(rawValue)
        let start: Date = .init(timeIntervalSince1970: TimeInterval(value.start))
        let end: Date = .init(timeIntervalSince1970: TimeInterval(value.end))
        let isBusy: Bool = value.is_busy == 1
        return .init(start: start, end: end, isBusy: isBusy)
    }
    

    /******************** Convenience routines **********************/

    /**     @brief Sets the DTSTART property to the given icaltime,
     *
     *      This method respects the icaltime type (DATE vs DATE-TIME) and
     *      timezone (or lack thereof).
     */
    // LIBICAL_ICAL_EXPORT void icalcomponent_set_dtstart(icalcomponent *comp, struct icaltimetype v);

    /**     @brief Gets the DTSTART property as an icaltime
     *
     *      If DTSTART is a DATE-TIME with a timezone parameter and a
     *      corresponding VTIMEZONE is present in the component, the
     *      returned component will already be in the correct timezone;
     *      otherwise the caller is responsible for converting it.
     *
     *      FIXME this is useless until we can flag the failure
     */
    // LIBICAL_ICAL_EXPORT struct icaltimetype icalcomponent_get_dtstart(icalcomponent *comp);

    /* For the icalcomponent routines only, dtend and duration are tied
       together. If you call the get routine for one and the other exists,
       the routine will calculate the return value. That is, if there is a
       DTEND and you call get_duration, the routine will return the difference
       between DTEND and DTSTART. However, if you call a set routine for
       one and the other exists, no action will be taken and icalerrno will
       be set to ICAL_MALFORMEDDATA_ERROR. If you call a set routine and
       neither exists, the routine will create the appropriate property. */

    /**     @brief Gets the DTEND property as an icaltime.
     *
     *      If a DTEND property is not present but a DURATION is, we use
     *      that to determine the proper end.
     *
     *      If DTSTART is a DATE-TIME with a timezone parameter and a
     *      corresponding VTIMEZONE is present in the component, the
     *      returned component will already be in the correct timezone;
     *      otherwise the caller is responsible for converting it.
     *
     *      For the icalcomponent routines only, dtend and duration are tied
     *      together. If you call the get routine for one and the other
     *      exists, the routine will calculate the return value. That is, if
     *      there is a DTEND and you call get_duration, the routine will
     *      return the difference between DTEND and DTSTART.
     *
     *      When DURATION and DTEND are both missing, for VEVENT an implicit
     *      DTEND is calculated based of DTSTART; for AVAILABLE, VAVAILABILITY,
     *      and VFREEBUSY null-time is returned.
     *
     *      Returns null-time, unless called on AVAILABLE, VEVENT,
     *      VAVAILABILITY, or VFREEBUSY components.
     *
     *      FIXME this is useless until we can flag the failure
     */
    // LIBICAL_ICAL_EXPORT struct icaltimetype icalcomponent_get_dtend(icalcomponent *comp);

    /**     @brief Sets the DTEND property to given icaltime.
     *
     *      This method respects the icaltime type (DATE vs DATE-TIME) and
     *      timezone (or lack thereof).
     *
     *      This also checks that a DURATION property isn't already there,
     *      and returns an error if it is. It's the caller's responsibility
     *      to remove it.
     *
     *      For the icalcomponent routines only, DTEND and DURATION are tied
     *      together. If you call this routine and DURATION exists, no action
     *      will be taken and icalerrno will be set to ICAL_MALFORMEDDATA_ERROR.
     *      If neither exists, the routine will create the appropriate
     *      property.
     */
    // LIBICAL_ICAL_EXPORT void icalcomponent_set_dtend(icalcomponent *comp, struct icaltimetype v);

    /** @brief Returns the time a VTODO task is DUE.
     *
     *  @param comp Valid calendar component.
     *
     *  Uses the DUE: property if it exists, otherwise we calculate the DUE
     *  value by adding the task's duration to the DTSTART time.
     */
    // LIBICAL_ICAL_EXPORT struct icaltimetype icalcomponent_get_due(icalcomponent *comp);

    /** @brief Sets the due date of a VTODO task.
     *
     *  @param comp Valid VTODO component.
     *  @param v    Valid due date time.
     *
     *  The DUE and DURATION properties are tied together:
     *  - If no duration or due properties then sets the DUE property.
     *  - If a DUE property is already set, then resets it to the value v.
     *  - If a DURATION property is already set, then calculates the new
     *    duration based on the supplied value of @p v.
     */
    // LIBICAL_ICAL_EXPORT void icalcomponent_set_due(icalcomponent *comp, struct icaltimetype v);

    /**     @brief Sets the DURATION property to given icalduration.
     *
     *      This method respects the icaltime type (DATE vs DATE-TIME) and
     *      timezone (or lack thereof).
     *
     *      This also checks that a DTEND property isn't already there,
     *      and returns an error if it is. It's the caller's responsibility
     *      to remove it.
     *
     *      For the icalcomponent routines only, DTEND and DURATION are tied
     *      together. If you call this routine and DTEND exists, no action
     *      will be taken and icalerrno will be set to ICAL_MALFORMEDDATA_ERROR.
     *      If neither exists, the routine will create the appropriate
     *      property.
     */
    // LIBICAL_ICAL_EXPORT void icalcomponent_set_duration(icalcomponent *comp, struct icaldurationtype v);

    /**     @brief Gets the DURATION property as an icalduration
     *
     *      For the icalcomponent routines only, DTEND and DURATION are tied
     *      together. If you call the get routine for one and the other
     *      exists, the routine will calculate the return value. That is, if
     *      there is a DTEND and you call get_duration, the routine will return
     *      the difference between DTEND and DTSTART in AVAILABLE, VEVENT, or
     *      VAVAILABILITY; and the difference between DUE and DTSTART in VTODO.
     *      When both DURATION and DTEND are missing from VEVENT an implicit
     *      duration is returned, based on the value-type of DTSTART. Otherwise
     *      null-duration is returned.
     */
    // LIBICAL_ICAL_EXPORT struct icaldurationtype icalcomponent_get_duration(icalcomponent *comp);

    /** @brief Sets the METHOD property to the given method.
     */
    // LIBICAL_ICAL_EXPORT void icalcomponent_set_method(icalcomponent *comp, icalproperty_method method);

    /** @brief Returns the METHOD property.
     */
    // LIBICAL_ICAL_EXPORT icalproperty_method icalcomponent_get_method(icalcomponent *comp);

    // LIBICAL_ICAL_EXPORT struct icaltimetype icalcomponent_get_dtstamp(icalcomponent *comp);

    // LIBICAL_ICAL_EXPORT void icalcomponent_set_dtstamp(icalcomponent *comp, struct icaltimetype v);

    // LIBICAL_ICAL_EXPORT void icalcomponent_set_summary(icalcomponent *comp, const char *v);

    // LIBICAL_ICAL_EXPORT const char *icalcomponent_get_summary(icalcomponent *comp);

    // LIBICAL_ICAL_EXPORT void icalcomponent_set_comment(icalcomponent *comp, const char *v);

    // LIBICAL_ICAL_EXPORT const char *icalcomponent_get_comment(icalcomponent *comp);

    // LIBICAL_ICAL_EXPORT void icalcomponent_set_uid(icalcomponent *comp, const char *v);

    // LIBICAL_ICAL_EXPORT const char *icalcomponent_get_uid(icalcomponent *comp);

    // LIBICAL_ICAL_EXPORT void icalcomponent_set_relcalid(icalcomponent *comp, const char *v);

    // LIBICAL_ICAL_EXPORT const char *icalcomponent_get_relcalid(icalcomponent *comp);

    // LIBICAL_ICAL_EXPORT void icalcomponent_set_recurrenceid(icalcomponent *comp, struct icaltimetype v);

    // LIBICAL_ICAL_EXPORT struct icaltimetype icalcomponent_get_recurrenceid(icalcomponent *comp);

    // LIBICAL_ICAL_EXPORT void icalcomponent_set_description(icalcomponent *comp, const char *v);

    // LIBICAL_ICAL_EXPORT const char *icalcomponent_get_description(icalcomponent *comp);

    // LIBICAL_ICAL_EXPORT void icalcomponent_set_location(icalcomponent *comp, const char *v);

    // LIBICAL_ICAL_EXPORT const char *icalcomponent_get_location(icalcomponent *comp);

    // LIBICAL_ICAL_EXPORT void icalcomponent_set_sequence(icalcomponent *comp, int v);

    // LIBICAL_ICAL_EXPORT int icalcomponent_get_sequence(icalcomponent *comp);

    // LIBICAL_ICAL_EXPORT void icalcomponent_set_status(icalcomponent *comp, enum icalproperty_status v);

    // LIBICAL_ICAL_EXPORT enum icalproperty_status icalcomponent_get_status(icalcomponent *comp);

    /** @brief Calls the given function for each TZID parameter found in the
     *  component, and any subcomponents.
     */
    // LIBICAL_ICAL_EXPORT void icalcomponent_foreach_tzid(icalcomponent *comp, void (*callback) (icalparameter *param,  void *data), void *callback_data);

    /** @brief Returns the icaltimezone in the component corresponding to the
     *  TZID, or NULL if it can't be found.
     */
    // LIBICAL_ICAL_EXPORT icaltimezone *icalcomponent_get_timezone(icalcomponent *comp, const char *tzid);

    /**
     * @brief Decides if a recurrence is acceptable.
     *
     * @param comp       A valid icalcomponent.
     * @param dtstart    The base dtstart value for this component.
     * @param recurtime  The time to test against.
     *
     * @return true if the recurrence value is excluded, false otherwise.
     *
     * This function decides if a specific recurrence value is
     * excluded by EXRULE or EXDATE properties.
     *
     * It's not the most efficient code.  You might get better performance
     * if you assume that recurtime is always increasing for each
     * call. Then you could:
     *
     *   - sort the EXDATE values
     *   - save the state of each EXRULE iterator for the next call.
     *
     * In this case though you don't need to worry how you call this
     * function.  It will always return the correct result.
     */
    //  LIBICAL_ICAL_EXPORT int icalproperty_recurrence_is_excluded(icalcomponent *comp, struct icaltimetype *dtstart, struct icaltimetype *recurtime);

    /**
     * @brief Cycles through all recurrences of an event.
     *
     * @param comp           A valid VEVENT component
     * @param start          Ignore timespans before this
     * @param end            Ignore timespans after this
     * @param callback       Function called for each timespan within the range
     * @param callback_data  Pointer passed back to the callback function
     *
     * This function will call the specified callback function for once
     * for the base value of DTSTART, and foreach recurring date/time
     * value.
     *
     * It will filter out events that are specified as an EXDATE or an EXRULE.
     *
     * TODO: We do not filter out duplicate RRULES/RDATES
     * TODO: We do not handle RDATEs with explicit periods
     */
//    LIBICAL_ICAL_EXPORT void icalcomponent_foreach_recurrence(icalcomponent *comp,
//                                                              struct icaltimetype start,
//                                                              struct icaltimetype end,
//                                                              void (*callback) (icalcomponent *comp,
//                                                                                struct icaltime_span *
//                                                                                span, void *data),
//                                                              void *callback_data);

    /**
     * @brief Normalizes (reorders and sorts the properties) the specified icalcomponent @p comp.
     * @since 3.0
     */
    // LIBICAL_ICAL_EXPORT void icalcomponent_normalize(icalcomponent *comp);

    /**
     * Computes the datetime corresponding to the specified @p icalproperty and @p icalcomponent.
     * If the property is a DATE-TIME with a TZID parameter and a corresponding VTIMEZONE
     * is present in the component, the returned component will already be in the correct
     * timezone; otherwise the caller is responsible for converting it.
     *
     * Call icaltime_is_null_time() on the returned value to detect failures.
     *
     * @since 3.0.5
     */
    // LIBICAL_ICAL_EXPORT struct icaltimetype icalproperty_get_datetime_with_component(icalproperty *prop, icalcomponent *comp);
}
