//
//  PropRdate.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropRdate
public class PropRdate: Property {
    
    /// icaldatetimeperiodtype
    public var value: icaldatetimeperiodtype {
        get { icalproperty_get_rdate(rawValue) }
        set { icalproperty_set_rdate(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: icaldatetimeperiodtype
    public convenience init(_ value: icaldatetimeperiodtype) {
        self.init(rawValue: icalproperty_new_rdate(value))
    }
}
