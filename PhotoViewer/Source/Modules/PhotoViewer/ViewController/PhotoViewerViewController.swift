//
//  PhotoViewerViewController.swift
//  PhotoViewer
//

import UIKit

class PhotoViewerViewController: UIViewController, CanInteractWithPresenter, CanShowStatusView {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchTextField: UITextField!
        
    @IBOutlet weak var collectionViewContainerView: UIView!
    
    weak var statusView: UIView?
    
    weak var statusContainerView: UIView?
    
    var presenter: PhotoViewerPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.placeholder = Strings.searchBarPlaceholderName
        
        statusContainerView = collectionViewContainerView
        
        collectionView.register(nib: PhotoViewerCell.self)
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

    func reloadCollectionView() {
        collectionView.performBatchUpdates({ [weak self] in
            self?.collectionView.reloadSections(IndexSet(integer: 0))
        }, completion: nil)
    }
}

extension PhotoViewerViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let searchTerm = textField.text,
            !searchTerm.isEmpty else {
                return true
        }
        
        self.presenter.fetchPhotos(forSearchTerm: searchTerm)
        textField.resignFirstResponder()
        return true
    }
    
}


