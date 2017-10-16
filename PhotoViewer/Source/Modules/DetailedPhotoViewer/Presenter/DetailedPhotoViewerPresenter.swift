//
//  DetailedPhotoViewerPresenter.swift
//  PhotoViewer

import UIKit

class DetailedPhotoViewerPresenter: Presenter {
    
    weak var viewController: DetailedPhotoViewerViewController?
    
    var image: UIImage
    
    init(withImage image: UIImage) {
        self.image = image
    }
    
}
