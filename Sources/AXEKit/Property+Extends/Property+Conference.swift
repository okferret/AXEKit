//
//  Property+Conference.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Conference
    public class Conference: Property {
        
        /// String
        public var value: String {
            get { icalproperty_get_conference(rawValue).hub.wrap() }
            set { icalproperty_set_conference(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: String
        public convenience init(_ value: String) {
            self.init(rawValue: icalproperty_new_conference(value))
        }
    }

}
