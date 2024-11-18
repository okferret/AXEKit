//
//  Event.swift
//  AXEKit
//
//  Created by okferret on 2024/11/18.
//

import libical
import Foundation

/// Event
public class Event: Component {

    /// 构建
    public convenience init() {
        self.init(rawValue: icalcomponent_new_vevent())
    }
}
