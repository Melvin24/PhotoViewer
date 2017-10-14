//
//  CollectionViewDataSource.swift
//  PhotoViewer

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(type: PhotoViewerCell.self, forIndexPath: indexPath)
        return cell
    }
}
