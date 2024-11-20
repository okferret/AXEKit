//
//  icaltimezone.swift
//  AXEKit
//
//  Created by okferret on 2024/11/20.
//

import Foundation
import libical

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
