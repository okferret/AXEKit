//
//  Property+Source.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Source
    public class Source: Property {
        
        /// String
        public var value: String {
            get { icalproperty_get_source(rawValue).hub.wrap() }
            set { icalproperty_set_source(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: String
        public convenience init(_ value: String) {
            self.init(rawValue: icalproperty_new_source(value))
        }
    }
}
