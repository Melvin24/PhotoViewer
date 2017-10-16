//
//  PhotoViewerViewController+PresenterDelegate.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 16/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

extension PhotoViewerViewController: PresenterDelegate {
    
    func presenterWillUpdateContent() {
        changeStatusView(with: presenter.loadingView())
    }
    
    func presenterDidUpdateContent() {
        
        var statusView: UIView?
        if presenter.flickrPhotos.count == 0 {
            statusView = presenter.noDataView()
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.reloadCollectionView()
            self?.changeStatusView(with: statusView)
        }
    }
    
    func presenterDidFail(withError error: Error) {
        DispatchQueue.main.async { [weak self] in
            self?.changeStatusView(with: self?.presenter.errorView(forError: error))
        }
    }
    
}
