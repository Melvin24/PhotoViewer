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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        searchTextField.placeholder = Strings.searchBarPlaceholderName
    }
}
