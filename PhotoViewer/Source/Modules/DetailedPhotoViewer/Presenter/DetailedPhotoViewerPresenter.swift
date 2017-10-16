//
//  DetailedPhotoViewerPresenter.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 16/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

class DetailedPhotoViewerPresenter: Presenter {
    
    weak var viewController: DetailedPhotoViewerViewController?
    
    var image: UIImage
    
    init(withImage image: UIImage) {
        self.image = image
    }
    
}
