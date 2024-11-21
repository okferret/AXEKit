//
//  Property+MinDate.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// MinDate
    public class MinDate: Property {
        
        /// Date
        public var value: Date {
            get { icalproperty_get_mindate(rawValue).hub.wrap() }
            set { icalproperty_set_mindate(rawValue, .hub.from(newValue)) }
        }
        
        /// 构建
        /// - Parameter value: Date
        public convenience init(_ value: Date) {
            self.init(rawValue: icalproperty_new_mindate(.hub.from(value)))
        }
    }

}
