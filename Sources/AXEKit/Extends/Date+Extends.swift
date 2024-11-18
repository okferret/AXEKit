//
//  Date+Extends.swift
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
}

// MARK: - icaltimezone
extension icaltimezone: CompatibleValue {}
extension CompatibleWrapper where Base == icaltimezone {
    
    /// wrap
    /// - Returns: TimeZone
    internal func wrap() -> Foundation.TimeZone {
        guard let element = base.tzid else { return .init(secondsFromGMT: 0)! }
        let tzid: String = .init(cString: element)
        return .init(identifier: tzid) ?? .init(secondsFromGMT: 0)!
    }
}
