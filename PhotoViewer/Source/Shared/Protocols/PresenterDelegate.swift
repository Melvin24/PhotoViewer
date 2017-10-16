//
//  PresenterDelegate.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 16/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

protocol PresenterDelegate: class {
    
    /// Delegate method sent when the presenter is about to start updating content.
    func presenterWillUpdateContent()
    
    /// Delegate method sent when the presenter has finished updating content.
    func presenterDidUpdateContent()
    
    /// Delegate method sent when the preseter failed with an error.
    func presenterDidFail(withError error: Error)
    
}

extension PresenterDelegate {
    
    func presenterWillUpdateContent() { }
    
    func presenterDidUpdateContent() { }
    
    func presenterDidFail(withError error: Error) { }
    
}
