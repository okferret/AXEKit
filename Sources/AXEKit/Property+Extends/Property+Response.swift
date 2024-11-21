//
//  Property+Response.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Response
    public class Response: Property {
        
        /// Int32
        public var value: Int32 {
            get { icalproperty_get_response(rawValue) }
            set { icalproperty_set_response(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: Int32
        public convenience init(_ value: Int32) {
            self.init(rawValue: icalproperty_new_response(value))
        }
    }
}
