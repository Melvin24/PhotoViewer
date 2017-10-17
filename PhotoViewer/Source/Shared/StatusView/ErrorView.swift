//
//  ErrorView.swift
//  PhotoViewer

import UIKit

class ErrorView: UIView {
    
    @IBOutlet weak var label: UILabel!
    
    var onRetryButtonSelect: (() -> Void)?
    
    @IBAction func didSelectRetryButton(_ sender: UIButton) {
        onRetryButtonSelect?()
    }
}
