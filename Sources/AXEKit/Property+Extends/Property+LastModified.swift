//
//  Property+LastModified.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// LastModified
    public class LastModified: Property {
        
        /// Date
        public var value: Date {
            get { icalproperty_get_lastmodified(rawValue).hub.wrap() }
            set { icalproperty_set_lastmodified(rawValue, .hub.from(newValue)) }
        }
        
        /// 构建
        /// - Parameter value: Date
        public convenience init(_ value: Date) {
            self.init(rawValue: icalproperty_new_lastmodified(.hub.from(value)))
        }
    }

}
