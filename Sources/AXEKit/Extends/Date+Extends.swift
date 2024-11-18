//
//  Date+Extends.swift
//  AXEKit
//
//  Created by okferret on 2024/11/18.
//

import Foundation
import libical

extension Date: CompatibleValue {}
extension CompatibleWrapper where Base == Date {
    
    /// from
    /// - Parameter icaltimetype: icaltimetype
    /// - Returns: Optional<Date>
    internal static func from(_ icaltimetype: icaltimetype) -> Optional<Date> {
        var cmpts: DateComponents = .init()
        cmpts.year      = Int(icaltimetype.year)
        cmpts.month     = Int(icaltimetype.month)
        cmpts.day       = Int(icaltimetype.day)
        cmpts.hour      = Int(icaltimetype.hour)
        cmpts.minute    = Int(icaltimetype.minute)
        cmpts.second    = Int(icaltimetype.second)
        if let newValue = icaltimetype.zone.pointee.tzid, let tz: TimeZone = .init(identifier: String(cString: newValue)) {
            cmpts.timeZone = tz
        } else {
            cmpts.timeZone = .init(abbreviation: "UTC")
        }
        let calendar: Calendar
        if cmpts.timeZone?.identifier == "UTC" {
            calendar = .init(identifier: .gregorian)
        } else {
            calendar = .current
        }
        if let date: Date = calendar.date(from: cmpts) {
            return date
        } else {
            return .none
        }
    }
    
  
}
