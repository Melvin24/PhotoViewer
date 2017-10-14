//
//  CollectionViewDelegate.swift
//  PhotoViewer

import UIKit

class CollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    /// Asks the delegate for the size of the header view in the specified section.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard section == 0 else {
            return .zero
        }
        return CGSize(width: collectionView.contentSize.width, height: 50)
    }

}
