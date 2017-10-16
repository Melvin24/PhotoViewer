//
//  CanInteractWithPresenter.swift
//  PhotoViewer

import Foundation

protocol CanInteractWithPresenter: class {
    
    associatedtype PresenterType: Presenter
    
    /// The preseer of the presentable.
    var presenter: PresenterType! { get }
    
}
