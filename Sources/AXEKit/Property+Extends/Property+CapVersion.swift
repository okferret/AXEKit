//
//  Property+CapVersion.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// CapVersion
    public class CapVersion: Property {
        
        /// String
        public var value: String {
            get { icalproperty_get_capversion(rawValue).hub.wrap() }
            set { icalproperty_set_capversion(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: String
        public convenience init(_ value: String) {
            self.init(rawValue: icalproperty_new_capversion(value))
        }
    }
}
