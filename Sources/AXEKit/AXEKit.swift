// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import libical

/// OpaquePointer
typealias icalcomponent = OpaquePointer
/// OpaquePointer
typealias icalproperty = OpaquePointer
/// OpaquePointer
typealias icalparameter = OpaquePointer
/// OpaquePointer
typealias icalvalue = OpaquePointer

/// icalcomponent_get_components
/// - Parameters:
///   - cmpt: icalcomponent
///   - kind: icalcomponent_kind
/// - Returns: [icalcomponent]
func icalcomponent_get_components(from cmpt: icalcomponent, kind: icalcomponent_kind) -> [icalcomponent] {
    var elements: [icalcomponent] = []
    if let first = icalcomponent_get_first_component(cmpt, kind) {
        elements.append(first)
    }
    while let next = icalcomponent_get_next_component(cmpt, kind) {
        elements.append(next)
    }
    return elements
}

/// icalcomponent_get_properties
/// - Parameters:
///   - cmpt: icalcomponent
///   - kind: icalproperty_kind
/// - Returns: [icalproperty]
func icalcomponent_get_properties(from cmpt: icalcomponent, kind: icalproperty_kind) -> [icalproperty] {
    var elements: [icalproperty] = []
    if let first = icalcomponent_get_first_property(cmpt, kind) {
        elements.append(first)
    }
    while let next = icalcomponent_get_next_property(cmpt, kind) {
        elements.append(next)
    }
    return elements
}

/// icalproperty_get_parameters
/// - Parameters:
///   - property: icalproperty
///   - kind: icalparameter_kind
/// - Returns: [icalparameter]
func icalproperty_get_parameters(from property: icalproperty, kind: icalparameter_kind) -> [icalparameter] {
    var elements: [icalparameter] = []
    if let first = icalproperty_get_first_parameter(property, kind) {
        elements.append(first)
    }
    while let next = icalproperty_get_next_parameter(property, kind) {
        elements.append(next)
    }
    return elements
}

// MARK: - Wrap
public struct Wrap<T>: Hashable where T: RawRepresentable<UInt32> {
    /// T
    internal let rawValue: T
    
    /// hash
    /// - Parameter hasher: Hasher
    public func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue.rawValue)
    }
    
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
}

/// Error
public enum AXError: Error, LocalizedError {
    case custom(_ text: String)
    
    /// Optional<String>
    public var errorDescription: Optional<String> {
        switch self {
        case .custom(let text): return text
        }
    }
}
