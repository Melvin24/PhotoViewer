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
    
    /// Asks the delegate for the size of the header view in the specified section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.contentSize.width, height: 50)
    }

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
    
}
