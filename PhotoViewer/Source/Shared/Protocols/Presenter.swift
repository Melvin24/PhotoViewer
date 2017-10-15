//
//  Presenter.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 14/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit


protocol Presenter: class {
    
    associatedtype viewController: UIViewController
        
    weak var viewController: viewController? { get set }
    
}
