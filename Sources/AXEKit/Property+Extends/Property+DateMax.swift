//
//  Property+DateMax.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// DateMax
    public class DateMax: Property {
        
        /// Date
        public var value: Date {
            get { icalproperty_get_datemax(rawValue).hub.wrap() }
            set { icalproperty_set_datemax(rawValue, .hub.from(newValue)) }
        }
        
        /// 构建
        /// - Parameter value: Date
        public convenience init(_ value: Date) {
            self.init(rawValue: icalproperty_new_datemax(.hub.from(value)))
        }
    }

}
