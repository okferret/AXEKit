//
//  Property+TZUntil.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// TZUntil
    public class TZUntil: Property {
        
        /// Date
        public var value: Date {
            get { icalproperty_get_tzuntil(rawValue).hub.wrap() }
            set { icalproperty_set_tzuntil(rawValue, .hub.from(newValue)) }
        }
        
        /// 构建
        /// - Parameter value: Date
        public convenience init(_ value: Date) {
            self.init(rawValue: icalproperty_new_tzuntil(.hub.from(value)))
        }
    }
}
