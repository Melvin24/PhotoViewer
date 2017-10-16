//
//  Presenter.swift
//  PhotoViewer

import UIKit


protocol Presenter: class {
    
    associatedtype viewController: UIViewController
        
    weak var viewController: viewController? { get set }
    
}
