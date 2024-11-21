//
//  Property+Duration.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Duration
    public class Duration: Property {
        
        /// icaldurationtype
        public var value: icaldurationtype {
            get { icalproperty_get_duration(rawValue) }
            set { icalproperty_set_duration(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: icaldurationtype
        public convenience init(_ value: icaldurationtype) {
            self.init(rawValue: icalproperty_new_duration(value))
        }
    }
}
