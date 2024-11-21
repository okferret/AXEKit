//
//  Property+Dtstamp.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Dtstamp
    public class Dtstamp: Property {
        
        /// Date
        public var value: Date {
            get { icalproperty_get_dtstamp(rawValue).hub.wrap() }
            set { icalproperty_set_dtstamp(rawValue, .hub.from(newValue)) }
        }
        
        /// 构建
        /// - Parameter value: Date
        public convenience init(_ value: Date) {
            self.init(rawValue: icalproperty_new_dtstamp(.hub.from(value)))
        }
    }

}
