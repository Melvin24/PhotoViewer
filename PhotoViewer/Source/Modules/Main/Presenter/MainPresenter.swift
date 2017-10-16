//
//  MainPresenter.swift
//  PhotoViewer

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
        
        try? navigationCoordinator.prepareForNavigation(source: viewController, destination: viewController, userInfo: nil)
        
    }
}
