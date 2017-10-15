//
//  CanInteractWithPresenter.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 15/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

protocol CanInteractWithPresenter: class {
    
    associatedtype PresenterType: Presenter
    
    /// The preseer of the presentable.
    var presenter: PresenterType! { get }
    
}
