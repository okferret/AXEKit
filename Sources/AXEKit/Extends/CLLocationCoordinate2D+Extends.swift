//
//  CLLocationCoordinate2D+Extends.swift
//  AXEKit
//
//  Created by okferret on 2024/11/18.
//

import CoreLocation
import libical

extension icalgeotype: CompatibleValue {}
extension CompatibleWrapper where Base == icalgeotype {
    
    /// wrap
    /// - Returns: CLLocationCoordinate2D
    internal func wrap() -> CLLocationCoordinate2D {
        return .init(latitude: base.lat, longitude: base.lon)
    }
}
