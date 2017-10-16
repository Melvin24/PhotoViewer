//
//  DetailedPhotoViewer.swift
//  PhotoViewer

import UIKit

class DetailedPhotoViewerViewController: UIViewController, CanInteractWithPresenter {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var closeButton: UIButton!
    
    var presenter: DetailedPhotoViewerPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = presenter.image
        
        closeButton.setTitleColor(.black, for: .normal)
        closeButton.backgroundColor = UIColor.white
        closeButton.layer.borderColor = UIColor.white.cgColor
        closeButton.layer.borderWidth = 0.5
        closeButton.layer.cornerRadius = 5
    }
    
    @IBAction func didSelectDismiss(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

extension DetailedPhotoViewerViewController {
    
    enum Storyboard: String {
        case name = "DetailedPhotoViewer"
    }
    
}
