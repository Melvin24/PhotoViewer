//
//  PhotoViewerViewController.swift
//  PhotoViewer
//

import UIKit

class PhotoViewerViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(nib: PhotoViewerCell.self)
        collectionView.register(nib: PhotoViewerSearchHeaderView.self, ofKind: UICollectionElementKindSectionHeader)
        
    }

}

