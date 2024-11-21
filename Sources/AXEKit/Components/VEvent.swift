//
//  VEvent.swift
//  AXEKit
//
//  Created by okferret on 2024/11/18.
//

import libical
import Foundation

/// VEvent
public class VEvent: Component {

    /// 构建
    public convenience init() {
        self.init(rawValue: icalcomponent_new_vevent())
    }
}
