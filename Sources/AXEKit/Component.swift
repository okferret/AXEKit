//
//  Component.swift
//  AXEKit
//
//  Created by okferret on 2024/11/15.
//

import libical
import Foundation

/// Component
public class Component: NSObject {
    
    // MARK: - 公开属性
    
    /// Kind
    public var kind: Kind {
        return .init(rawValue: icalcomponent_isa(rawValue))
    }
    /// Array<Component>
    public var components: Array<Component> {
        return Set(Component.Kind.allCases).subtracting([.ANY]).reduce([]) { $0 + icalcomponent_get_components(from: rawValue, kind: $1.rawValue) }.map { .init(rawValue: $0) }
    }
    /// Array<Property>
    public var properties: Array<Property> {
        return Set(Property.Kind.allCases).subtracting([.ANY]).reduce([]) { $0 + icalcomponent_get_properties(from: rawValue, kind: $1.rawValue) }.map { .init(rawValue: $0) }
    }
    /// description
    public override var description: String {
        if let value = icalcomponent_as_ical_string(rawValue) {
            return .init(cString: value)
        } else {
            return super.description
        }
    }
    
    // MARK: - 私有属性
    
    /// icalcomponent
    private let rawValue: icalcomponent
    
    // MARK: - 生命周期
    
    /// 构建
    /// - Parameter rawValue: icalcomponent
    internal init(rawValue: icalcomponent) {
        self.rawValue = rawValue
        super.init()
    }
    
    /// 构建
    /// - Parameter rfc5545: String
    public convenience init(rfc5545: String) {
        let cmpt: icalcomponent = icalcomponent_new_from_string(rfc5545)
        self.init(rawValue: cmpt)
    }
    
    /// 构建
    /// - Parameter component: Component
    private convenience init(component: Component) {
        self.init(rawValue: component.rawValue)
    }
    
    /// 构建
    /// - Parameter kind: Kind
    public convenience init(kind: Kind) {
        self.init(rawValue: icalcomponent_new(kind.rawValue))
    }
    
    deinit {
        icalcomponent_free(rawValue)
    }
}

extension Component {
    
    /// rfc5545
    /// - Returns: String
    internal func rfc5545() -> String {
        if let value = icalcomponent_as_ical_string(rawValue) {
            return .init(cString: value)
        } else {
            return ""
        }
    }
}
