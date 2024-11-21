//
//  PropRequestStatus.swift
//  AXEKit
//
//  Created by okferret on 2024/11/21.
//

import Foundation
import libical

/// PropRequestStatus
public class PropRequestStatus: Property {
    
    /// icalreqstattype
    public var value: icalreqstattype {
        get { icalproperty_get_requeststatus(rawValue) }
        set { icalproperty_set_requeststatus(rawValue, newValue) }
    }
    
    /// 构建
    /// - Parameter value: icalreqstattype
    public convenience init(_ value: icalreqstattype) {
        self.init(rawValue: icalproperty_new_requeststatus(value))
    }
}
