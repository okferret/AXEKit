//
//  Property+Dtend.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Dtend
    public class Dtend: Property {
        
        /// Date
        public var value: Date {
            get { icalproperty_get_dtend(rawValue).hub.wrap() }
            set { icalproperty_set_dtend(rawValue, .hub.from(newValue)) }
        }
        
        /// 构建
        /// - Parameter value: Date
        public convenience init(_ value: Date) {
            self.init(rawValue: icalproperty_new_dtend(.hub.from(value)))
        }
    }
}