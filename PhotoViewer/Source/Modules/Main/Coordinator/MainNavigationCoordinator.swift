//
//  MainNavigationCoordinator.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 15/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

class MainNavigationCoordinator: Coordinatable {
    
    func prepareForNavigation<From, To>(source: From, destination: To) throws {
        
        guard let destination = destination as? MainViewController else {
            throw CoordinateError.unsupported("Coordination isnt supported")
        }
        
        let presenter = MainPresenter()
        
        presenter.viewController = destination
        
        destination.presenter = presenter
    }
}
