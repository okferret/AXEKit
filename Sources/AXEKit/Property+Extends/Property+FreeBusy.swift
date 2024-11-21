//
//  Property+FreeBusy.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// FreeBusy
    public class FreeBusy: Property {
        
        /// icalperiodtype
        public var value: icalperiodtype {
            get { icalproperty_get_freebusy(rawValue) }
            set { icalproperty_set_freebusy(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: icalperiodtype
        public convenience init(_ value: icalperiodtype) {
            self.init(rawValue: icalproperty_new_freebusy(value))
        }
    }
}
