//
//  MainPresenter.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 15/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

class MainPresenter: Presenter {
    
    weak var viewController: MainViewController?
    
    func navigateToPhotoViewer() {
        
        guard let viewController = self.viewController else {
            return
        }
        
        viewController.performSegue(withIdentifier: MainViewController.Segue.mainToPhotoViewer.rawValue, sender: viewController)
        
    }
    
    func preparePhotoViewerViewController(_ viewController: UIViewController) {
        
        let navigationCoordinator = PhotoViewerNavigationCoordinator()
        
        try? navigationCoordinator.prepareForNavigation(source: viewController, destination: viewController)
        
    }
}
