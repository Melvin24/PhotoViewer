//
//  CollectionViewDelegate.swift
//  PhotoViewer

import UIKit

class CollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let numberOfItemsPerRowLandscape: CGFloat = 4
    let numberOfItemsPerRowPortrait: CGFloat = 3
    let lineSpacing: CGFloat = 4
    let interitemSpacing: CGFloat = 4
    let sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    
    var device = UIDevice.current
    
    @IBOutlet weak var viewController: PhotoViewerViewController!
    
    /// Asks the delegate for the spacing between successive items in the rows or columns of a section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    /// Asks the delegate for the spacing between successive rows or columns of a section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return interitemSpacing
    }
    
    /// Asks the delegate for the margins to apply to content in the specified section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxContentWidth = viewController.view.frame.width
        
        let availableContentWidth = maxContentWidth - (sectionInset.left + sectionInset.right + interitemSpacing)
        
        guard availableContentWidth > 0 else {
            return .zero
        }
        
        let itemsPerRow = device.orientation.isLandscape ? numberOfItemsPerRowLandscape : numberOfItemsPerRowPortrait
        
        let maxWidthPerItem = availableContentWidth/itemsPerRow
        
        return CGSize(width: maxWidthPerItem, height: maxWidthPerItem)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let flickrPhotos = viewController.presenter.flickrPhotos
        
        guard indexPath.row < flickrPhotos.count else {
            return
        }
        
        guard let image = flickrPhotos[indexPath.row].image else {
            return
        }
        
        guard let detailedPhotoViewController = viewController.presenter.detailedPhotoViewerViewController(with: image) else {
            return
        }
        
        viewController.presentViewController(detailedPhotoViewController)
        
    }
    
}
