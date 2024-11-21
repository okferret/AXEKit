//
//  Property+DefaultTZID.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// DefaultTZID
    public class DefaultTZID: Property {
        
        /// String
        public var value: String {
            get { icalproperty_get_defaulttzid(rawValue).hub.wrap() }
            set { icalproperty_set_defaulttzid(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: String
        public convenience init(_ value: String) {
            self.init(rawValue: icalproperty_new_defaulttzid(value))
        }
    }

}
