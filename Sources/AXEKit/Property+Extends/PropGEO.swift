//
//  PropGEO.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import CoreLocation
import libical

/// PropGEO
public class PropGEO: Property {
    
    /// CLLocationCoordinate2D
    public var value: CLLocationCoordinate2D {
        get { icalproperty_get_geo(rawValue).hub.wrap() }
        set { icalproperty_set_geo(rawValue, .hub.from(newValue)) }
    }
    
    /// 构建
    /// - Parameter value: CLLocationCoordinate2D
    public convenience init(_ value: CLLocationCoordinate2D) {
        self.init(rawValue: icalproperty_new_geo(.hub.from(value)))
    }
}
