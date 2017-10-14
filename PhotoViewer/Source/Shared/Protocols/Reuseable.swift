//
//  Reuseable.swift
//  PhotoViewer

import Foundation

/// A reuse protocol for objects that can be reused and that require an identifier.
public protocol Reuseable: class {
    
    /// The default reuse identifier for the object. For cells this might be the class name.
    static var defaultReuseIdentifier: String { get }
    
}
