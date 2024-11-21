//
//  Property+PatchParameter.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// PatchParameter
    public class PatchParameter: Property {
        
        /// String
        public var value: String {
            get { icalproperty_get_patchparameter(rawValue).hub.wrap() }
            set { icalproperty_set_patchparameter(rawValue, newValue) }
        }
        
        /// 构建
        /// - Parameter value: String
        public convenience init(_ value: String) {
            self.init(rawValue: icalproperty_new_patchparameter(value))
        }
    }

}
