//
//  Property+ExRule.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// ExRule
    public class ExRule: Property {
        
        /// icalrecurrencetype
        public var value: icalrecurrencetype {
            get { icalproperty_get_rrule(rawValue) }
            set { icalproperty_set_rrule(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: icalrecurrencetype
        public convenience init(_ value: icalrecurrencetype) {
            self.init(rawValue: icalproperty_new_rrule(value))
        }
    }

}
