//
//  Property+Completed.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Completed
    public class Completed: Property {
        
        /// Date
        public var value: Date {
            get { icalproperty_get_completed(rawValue).hub.wrap() }
            set { icalproperty_set_completed(rawValue, .hub.from(newValue)) }
        }
        
        /// 构建
        /// - Parameter value: Date
        public convenience init(_ value: Date) {
            self.init(rawValue: icalproperty_new_completed(.hub.from(value)))
        }
    }

}
