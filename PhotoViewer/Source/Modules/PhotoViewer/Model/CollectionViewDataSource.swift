//
//  CollectionViewDataSource.swift
//  PhotoViewer

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    @IBOutlet weak var viewController: PhotoViewerViewController!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewController.presenter.flickrPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(type: PhotoViewerCell.self, forIndexPath: indexPath)
        
        guard let image = viewController.presenter.flickrPhotos[indexPath.row].image else {
            return cell
        }

        cell.imageView.image = image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            let searchHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader,
                                                                       type: PhotoViewerSearchHeaderView.self,
                                                                       forIndexPath: indexPath)
            searchHeaderView.searchTermPhotoHandler = self.viewController
            
            return searchHeaderView
        default:
            return UICollectionReusableView()
        }

    }
}
