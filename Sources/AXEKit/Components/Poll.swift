//
//  Poll.swift
//  AXEKit
//
//  Created by okferret on 2024/11/18.
//

import Foundation
import libical

/// Poll
public class Poll: Component {
  
    /// 构建
    public convenience init() {
        self.init(rawValue: icalcomponent_new_vpoll())
    }
}
