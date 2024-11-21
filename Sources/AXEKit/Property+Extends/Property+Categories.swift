//
//  Property+Categories.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Categories
    public class Categories: Property {
        
        /// String
        public var value: String {
            get { icalproperty_get_categories(rawValue).hub.wrap() }
            set { icalproperty_set_categories(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: String
        public convenience init(_ value: String) {
            self.init(rawValue: icalproperty_new_categories(value))
        }
    }
}
