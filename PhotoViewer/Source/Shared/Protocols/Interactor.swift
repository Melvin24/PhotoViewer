//
//  Interactor.swift
//  PhotoViewer

import Foundation

protocol Interactor: class {
    
    associatedtype Object
    
    associatedtype Argument
    
    typealias Completion = (Object?, Error?) -> Void
    
    var task: Task? { get set }
    
    func fetchData(withArgument argument: Argument, completion: @escaping Completion)
    
    func invalidateFetch()
    
}

extension Interactor {
    
    func invalidateFetch() {
        task?.cancel()
    }
    
}
