//
//  Property+RefreshInterval.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// RefreshInterval
    public class RefreshInterval: Property {
        
        /// Date
        public var value: icaldurationtype {
            get { icalproperty_get_refreshinterval(rawValue) }
            set { icalproperty_set_refreshinterval(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: icaldurationtype
        public convenience init(_ value: icaldurationtype) {
            self.init(rawValue: icalproperty_new_refreshinterval(value))
        }
    }
}
