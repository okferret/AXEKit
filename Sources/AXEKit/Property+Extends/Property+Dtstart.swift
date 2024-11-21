//
//  Property+Dtstart.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Dtstart
    public class Dtstart: Property {
        
        /// Date
        public var value: Date {
            get { icalproperty_get_dtstart(rawValue).hub.wrap() }
            set { icalproperty_set_dtstart(rawValue, .hub.from(newValue)) }
        }
        
        /// 构建
        /// - Parameter value: Date
        public convenience init(_ value: Date) {
            self.init(rawValue: icalproperty_new_dtstart(.hub.from(value)))
        }
    }

}