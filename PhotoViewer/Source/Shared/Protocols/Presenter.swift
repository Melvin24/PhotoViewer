//
//  Presenter.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 14/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

/// The interface which defines the Loading of data.
public protocol CanLoadContent: class {
    /// Use this protocol method to load any required data for the view. For example performing a network request.
    func loadIfRequired()
}


protocol Presenter: class, CanLoadContent {
    
    associatedtype viewController: UIViewController
    
    associatedtype interactor: Interactor
    
    weak var viewController: viewController? { get }
    
    var interactor: interactor { get }
    
}
