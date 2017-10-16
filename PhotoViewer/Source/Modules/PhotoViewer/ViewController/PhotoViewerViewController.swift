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
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        /// On Transition animation finish invalidate collection view layout
        coordinator.animate(alongsideTransition: nil) { [weak self] _ in
            
            guard let collectionView = self?.collectionView else {
                return
            }
            
            self?.invalidateCollectionViewLayout(collectionView)
        }
    }

    func invalidateCollectionViewLayout(_ collectionView: UICollectionView) {
        collectionView.collectionViewLayout.invalidateLayout()
    }

}

extension PhotoViewerViewController: CanSearchPhotosForTerm {
    
    func searchPhotos(forTerm searchTerm: String) {
        self.presenter.fetchPhotos(forSearchTerm: searchTerm)
    }
    
}

