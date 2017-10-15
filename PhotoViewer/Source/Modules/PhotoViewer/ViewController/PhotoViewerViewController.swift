//
//  PhotoViewerViewController.swift
//  PhotoViewer
//

import UIKit

class PhotoViewerViewController: UIViewController, CanInteractWithPresenter {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: PhotoViewerPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(nib: PhotoViewerCell.self)
        collectionView.register(nib: PhotoViewerSearchHeaderView.self, ofKind: UICollectionElementKindSectionHeader)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}

