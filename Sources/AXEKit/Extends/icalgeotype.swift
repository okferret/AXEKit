//
//  icalgeotype.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
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
     
    /// from coordinate2D
    /// - Parameter coordinate2D: CLLocationCoordinate2D
    /// - Returns: icalgeotype
    internal static func from(_ coordinate2D: CLLocationCoordinate2D) -> icalgeotype {
        return .init(lat: coordinate2D.latitude, lon: coordinate2D.longitude)
    }
}
