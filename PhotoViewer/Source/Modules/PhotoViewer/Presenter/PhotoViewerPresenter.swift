//
//  PhotoViewerPresenter.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 15/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

class PhotoViewerPresenter: Presenter {
    
    weak var viewController: PhotoViewerViewController?
    
    var interactor: PhotoViewerInteractor
    
    var flickrPhotos: [FlickrPhoto] = []
    
    init(viewController: PhotoViewerViewController, interactor: PhotoViewerInteractor) {
        self.viewController = viewController
        self.interactor = interactor
    }

    func fetchPhotos(forSearchTerm searchTerm: String) {
        self.viewController?.presenterWillUpdateContent()
        interactor.fetchData(withArgument: searchTerm) { [weak self] flickrPhotos, error in
            self?.flickrPhotos = flickrPhotos ?? []
            self?.viewController?.presenterDidUpdateContent()
        }
    }
    
    func loadingView() -> UIView {
        return UIView.loadViewFromNib(as: LoadingView.self)
    }
    
    
//    func errorView(forError error: Error) -> UIView {
//        
//        
//        
//    }
}
