//
//  PhotoViewerPresenter.swift
//  PhotoViewer

import UIKit

class PhotoViewerPresenter: Presenter {
    
    weak var viewController: PhotoViewerViewController?
    
    var interactor: PhotoViewerInteractor
    
    var flickrPhotos: [FlickrPhoto] = []
    
    var currentSearchTerm: String = ""
    
    init(viewController: PhotoViewerViewController, interactor: PhotoViewerInteractor) {
        self.viewController = viewController
        self.interactor = interactor
    }

    func fetchPhotos(forSearchTerm searchTerm: String) {

        currentSearchTerm = searchTerm
        
        self.viewController?.presenterWillUpdateContent()

        interactor.fetchData(withArgument: searchTerm) { [weak self] flickrPhotos, error in
            
            if let error = error {
                self?.viewController?.presenterDidFail(withError: error)
            } else {
                self?.flickrPhotos = flickrPhotos ?? []
                self?.viewController?.presenterDidUpdateContent()
            }
            
        }
    }
    
}
