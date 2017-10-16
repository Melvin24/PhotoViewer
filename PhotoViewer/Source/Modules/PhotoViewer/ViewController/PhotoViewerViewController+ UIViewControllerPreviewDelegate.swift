//
//  PhotoViewerViewController+ UIViewControllerPreviewDelegate.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 16/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

extension PhotoViewerViewController: UIViewControllerPreviewingDelegate {
    @available(iOS 9.0, *)
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        presentViewController(viewControllerToCommit)
    }

    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        guard let indexPath = collectionView.indexPathForItem(at: location) else {
            return nil
        }
        
        let flickrPhotos = presenter.flickrPhotos

        guard indexPath.row < flickrPhotos.count else {
            return nil
        }
        
        guard let cell = collectionView?.cellForItem(at: indexPath) else {
            return nil
        }

        guard let image = flickrPhotos[indexPath.row].image else {
            return nil
        }
        
        guard let detailedPhotoViewController = presenter.detailedPhotoViewerViewController(with: image) else {
            return nil
        }

        
        detailedPhotoViewController.preferredContentSize = CGSize(width: 0.0, height: 300)
        
        previewingContext.sourceRect = cell.frame
        
        return detailedPhotoViewController
        
    }
    
}

