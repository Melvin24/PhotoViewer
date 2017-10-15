//
//  Interactor.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 14/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

protocol Interactor: class {
    
    associatedtype Object
    
    typealias Completion = (Object?, Error?) -> Void
    
    var task: Task? { get set }
    
    func fetchData(completion: Completion)
    
    func invalidateFetch()
    
}

extension Interactor {
    
    func invalidateFetch() {
        task?.cancel()
    }
    
}