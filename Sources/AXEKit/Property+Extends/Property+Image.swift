//
//  Property+Image.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Property
    public class Image: Property {
        
        /// String
        public var url: String {
            get { icalattach_get_url(icalproperty_get_image(rawValue)).hub.wrap() }
            set { icalproperty_new_image(icalattach_new_from_url(newValue)) }
        }
        
        /// 构建
        /// - Parameter url: String
        public convenience init(_ url: String) {
            self.init(rawValue: icalproperty_new_image(icalattach_new_from_url(url)))
        }
    }

}
