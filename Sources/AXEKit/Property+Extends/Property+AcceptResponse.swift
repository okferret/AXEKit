//
//  Property+AcceptResponse.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// AcceptResponse
    public class AcceptResponse: Property {
        
        /// String
        public var value: String {
            get { icalproperty_get_acceptresponse(rawValue).hub.wrap() }
            set { icalproperty_set_acceptresponse(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: String
        public convenience init(_ value: String) {
            self.init(rawValue: icalproperty_new_acceptresponse(value))
        }
    }
}
