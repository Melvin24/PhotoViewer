//
//  Task.swift
//  PhotoViewer

import Foundation

/// A Task represents any syncronus or asyncronus object so we can cancel, suspend and resume.
protocol Task {
    
    /// Determines whether the task is running.
    var isRunning: Bool { get }
    
    /// Start the task
    func start()
    
    /// Resume a currently suspended or non-started task.
    func resume()
    
    /// Cancels the task.
    func cancel()
    
}

extension URLSessionTask: Task {
    
    func start() {
        resume()
    }

    
    public var isRunning: Bool {
        return state == .running
    }
    
}
