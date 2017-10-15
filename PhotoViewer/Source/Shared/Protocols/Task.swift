//
//  Task.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 14/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

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
