//
//  Property+Trigger.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Trigger
    public class Trigger: Property {
        
        /// icaltriggertype
        public var value: icaltriggertype {
            get { icalproperty_get_trigger(rawValue) }
            set { icalproperty_set_trigger(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: icaltriggertype
        public convenience init(_ value: icaltriggertype) {
            self.init(rawValue: icalproperty_new_trigger(value))
        }
    }
}
