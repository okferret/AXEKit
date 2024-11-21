//
//  VCalendar.swift
//  AXEKit
//
//  Created by okferret on 2024/11/18.
//

import libical
import Foundation

/// VCalendar
public class VCalendar: Component {

    /// 构建
    public convenience init() {
        self.init(rawValue: icalcomponent_new_vcalendar())
    }
}


extension VCalendar {
    
    /// 解析数据
    /// - Parameter rfc5545: String
    /// - Returns: Calendar
    internal static func parse(_ rfc5545: String) throws -> VCalendar {
        return try .init(rfc5545: rfc5545)
    }
}
