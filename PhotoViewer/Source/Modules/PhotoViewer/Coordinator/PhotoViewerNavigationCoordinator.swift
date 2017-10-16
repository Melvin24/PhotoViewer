//
//  PhotoViewerNavigationCoordinator.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 15/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

class PhotoViewerNavigationCoordinator: Coordinatable {
    
    func prepareForNavigation<From, To>(source: From, destination: To) throws {
        
        guard let destination = destination as? PhotoViewerViewController else {
            throw CoordinateError.unsupported("Coordination isnt supported")
        }
        
        let interactorRequest: PhotoViewerInteractor.RequestType = { searchTerm in
            return FlickrPhotoNetworking.fetchFlickrPhotos(forSearchTerm: searchTerm, session: .shared)
        }
        
        let interactor = PhotoViewerInteractor(withRequest: interactorRequest)
        
        let presenter = PhotoViewerPresenter(viewController: destination, interactor: interactor)
        
        destination.presenter = presenter
    }
}

//,
//let destination = navigationController.topViewController as? PhotoViewerViewController
