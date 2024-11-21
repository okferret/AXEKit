//
//  Property+RecurrenceID.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// RecurrenceID
    public class RecurrenceID: Property {
        
        /// Date
        public var value: Date {
            get { icalproperty_get_recurrenceid(rawValue).hub.wrap() }
            set { icalproperty_set_recurrenceid(rawValue, .hub.from(newValue)) }
        }
        
        /// 构建
        /// - Parameter value: Date
        public convenience init(_ value: Date) {
            self.init(rawValue: icalproperty_new_recurrenceid(.hub.from(value)))
        }
    }

}
