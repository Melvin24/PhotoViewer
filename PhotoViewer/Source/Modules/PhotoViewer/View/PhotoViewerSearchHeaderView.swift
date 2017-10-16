//
//  PhotoViewerSearchHeaderView.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 14/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

class PhotoViewerSearchHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    var searchTermPhotoHandler: CanSearchPhotosForTerm?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        searchTextField.placeholder = Strings.searchBarPlaceholderName
    }
}

extension PhotoViewerSearchHeaderView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let searchTerm = textField.text,
              !searchTerm.isEmpty else {
            return true
        }
        
        searchTermPhotoHandler?.searchPhotos(forTerm: searchTerm)
        
        return true
    }
    
}
