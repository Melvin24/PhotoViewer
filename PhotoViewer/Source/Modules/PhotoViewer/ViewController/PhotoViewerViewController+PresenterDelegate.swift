//
//  PhotoViewerViewController+PresenterDelegate.swift
//  PhotoViewer

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
