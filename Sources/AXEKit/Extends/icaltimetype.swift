//
//  icaltimetype.swift
//  AXEKit
//
//  Created by okferret on 2024/11/18.
//

import Foundation
import libical

extension icaltimetype: CompatibleValue {}
extension CompatibleWrapper where Base == icaltimetype {

    /// toDate
    /// - Returns: Date
    internal func wrap() -> Date {
        var cmpts: DateComponents = .init()
        cmpts.calendar  = .current
        cmpts.year      = Int(base.year)
        cmpts.month     = Int(base.month)
        cmpts.day       = Int(base.day)
        cmpts.hour      = Int(base.hour)
        cmpts.minute    = Int(base.minute)
        cmpts.second    = Int(base.second)
        if let zone = base.zone {
            cmpts.timeZone = zone.pointee.hub.wrap()
        } else {
            cmpts.timeZone = .init(abbreviation: "UTC")
        }
        return cmpts.date!
    }
    
    /// from
    /// - Parameter date: Date
    /// - Returns: icaltimetype
    internal static func from(_ date: Date) -> icaltimetype {
        var calendar: Foundation.Calendar = .autoupdatingCurrent
        calendar.timeZone = .init(abbreviation: "UTC")!
        let cmpts: DateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let element: icaltimetype = .init(year: Int32(cmpts.year!),
                                          month: Int32(cmpts.month!),
                                          day: Int32(cmpts.day!),
                                          hour: Int32(cmpts.hour!),
                                          minute: Int32(cmpts.minute!),
                                          second: Int32(cmpts.second!),
                                          is_date: 1,
                                          is_daylight: calendar.timeZone.isDaylightSavingTime() ? 1 : 0,
                                          zone: icaltimezone_get_utc_timezone())
        return element
    }
}

