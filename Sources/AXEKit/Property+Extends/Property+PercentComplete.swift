//
//  Property+PercentComplete.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// PercentComplete
    public class PercentComplete: Property {
        
        /// Int32
        public var value: Int32 {
            get { icalproperty_get_percentcomplete(rawValue) }
            set { icalproperty_set_percentcomplete(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: Int32
        public convenience init(_ value: Int32) {
            self.init(rawValue: icalproperty_new_percentcomplete(value))
        }
    }

}
