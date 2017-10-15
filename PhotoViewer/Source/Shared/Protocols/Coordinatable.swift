//
//  Coordinatable.swift
//  PhotoViewer

import Foundation

/// Errors produced from coordinating
public enum CoordinateError: Error {
    
    /// - unsupported: The coordination was not supported.
    case unsupported(String)
    
}

/// Identifies something capable of preparing navigation
public protocol Coordinatable {
    
    /// Prepare the destination for navigation.
    ///
    /// - parameter source:      The source object.
    /// - parameter destination: The destination object.
    ///
    /// - throws: If the coordination fails.
    func prepareForNavigation<From, To>(source: From, destination: To) throws
    
}
