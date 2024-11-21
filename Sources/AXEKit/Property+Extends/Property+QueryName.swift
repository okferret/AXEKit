//
//  Property+QueryName.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// QueryName
    public class QueryName: Property {
        
        /// String
        public var value: String {
            get { icalproperty_get_queryname(rawValue).hub.wrap() }
            set { icalproperty_set_queryname(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: String
        public convenience init(_ value: String) {
            self.init(rawValue: icalproperty_new_queryname(value))
        }
    }

}
