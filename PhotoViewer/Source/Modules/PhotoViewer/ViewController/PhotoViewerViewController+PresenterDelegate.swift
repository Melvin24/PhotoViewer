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
        DispatchQueue.main.sync { [weak self] in
            self?.changeStatusView(with: nil)
            self?.reloadCollectionView()
        }
    }
    
    func presenterDidFail(withError error: Error) {
        
    }
    
}
