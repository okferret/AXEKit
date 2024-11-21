//
//  Property+Csid.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Csid
    public class CSID: Property {
        
        /// String
        public var value: String {
            get { icalproperty_get_csid(rawValue).hub.wrap() }
            set { icalproperty_set_csid(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: String
        public convenience init(_ value: String) {
            self.init(rawValue: icalproperty_new_csid(value))
        }
    }
}
