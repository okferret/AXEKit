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
        return Set(Component.Kind.allCases).subtracting([.ANY]).reduce([]) { $0 + icalcomponent_get_components(from: rawValue, kind: $1.rawValue) }.map { .from($0) }
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
    internal let rawValue: icalcomponent
    
    // MARK: - 生命周期
    
    /// 构建
    /// - Parameter rawValue: icalcomponent
    internal init(rawValue: icalcomponent) {
        self.rawValue = rawValue
        super.init()
    }
    
    /// 构建
    /// - Parameter rfc5545: String
    internal convenience init(rfc5545: String) throws {
        if let cmpt: icalcomponent = icalcomponent_new_from_string(rfc5545) {
            self.init(rawValue: cmpt)
        } else {
            throw AXError.custom("rfc5545 解析失败")
        }
    }
    
    /// 构建
    /// - Parameter component: Component
    public convenience init(component: Component) {
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
    public func rfc5545() -> String {
        if let value = icalcomponent_as_ical_string(rawValue) {
            return .init(cString: value)
        } else {
            return ""
        }
    }
    
    /// add property
    /// - Parameter property: Property
    public func add(_ property: Property) {
        icalcomponent_add_property(rawValue, property.rawValue)
    }
    
    /// remove property
    /// - Parameter property: Property
    public func remove(_ property: Property) {
        icalcomponent_remove_property(rawValue, property.rawValue)
    }
    
    /// count for kind
    /// - Parameter kind: Property.Kind
    /// - Returns: Int
    public func count(for kind: Property.Kind) -> Int {
        return Int(icalcomponent_count_properties(rawValue, kind.rawValue))
    }
    
    /// add component
    /// - Parameter component: Component
    public func add(_ component: Component) {
        icalcomponent_add_component(rawValue, component.rawValue)
    }
    /// remove componnet
    /// - Parameter componnet: Component
    public func remove(_ componnet: Component) {
        icalcomponent_remove_component(rawValue, componnet.rawValue)
    }
    
    /// count for kind
    /// - Parameter kind: Component.Kind
    /// - Returns: Int
    public func count(for kind: Component.Kind) -> Int {
        return Int(icalcomponent_count_components(rawValue, kind.rawValue))
    }
    
    /// merge component
    /// - Parameter component: Component
    public func merge(_ component: Component) {
        icalcomponent_merge_component(rawValue, component.rawValue)
    }
 
}

