//
//  Property+Attachment.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

extension Property {
    
    /// Attachment
    public class Attachment: Property {
        
        /// String
        public var url: String {
            get { icalattach_get_url(icalproperty_get_attach(rawValue)).hub.wrap() }
            set { icalproperty_new_attach(icalattach_new_from_url(newValue)) }
        }
        
        /// 构建
        /// - Parameter url: String
        public convenience init(_ url: String) {
            self.init(rawValue: icalproperty_new_attach(icalattach_new_from_url(url)))
        }
    }

}
