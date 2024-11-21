//
//  Property+PatchOrder.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// PatchOrder
    public class PatchOrder: Property {
        
        /// Int32
        public var value: Int32 {
            get { icalproperty_get_patchorder(rawValue) }
            set { icalproperty_set_patchorder(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: Int32
        public convenience init(_ value: Int32) {
            self.init(rawValue: icalproperty_new_patchorder(value))
        }
    }
}
