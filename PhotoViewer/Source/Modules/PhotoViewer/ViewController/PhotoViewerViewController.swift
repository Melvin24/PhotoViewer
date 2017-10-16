//
//  PhotoViewerViewController.swift
//  PhotoViewer
//

import UIKit

class PhotoViewerViewController: UIViewController, CanInteractWithPresenter {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchTextField: UITextField!
    
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

extension PhotoViewerViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let searchTerm = textField.text,
            !searchTerm.isEmpty else {
                return true
        }
        
        self.presenter.fetchPhotos(forSearchTerm: searchTerm)
        
        return true
    }
    
}


