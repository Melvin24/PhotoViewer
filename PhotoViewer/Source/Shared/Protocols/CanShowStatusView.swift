//
//  CanShowStatusView.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 16/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

protocol CanShowStatusView: class {
    
    weak var statusView: UIView? { get set }
    
    weak var statusContainerView: UIView? { get set }
    
}

extension CanShowStatusView {
    
    public func changeStatusView(with newStatusView: UIView?) {
        
        self.statusView?.removeFromSuperview()
        
        self.statusView = newStatusView
        
        guard let statusView = self.statusView, let containerView = self.statusContainerView else {
            return
        }
        
        containerView.addSubview(statusView)
        
        statusView.translatesAutoresizingMaskIntoConstraints = false
        
        let viewBindings: [String : Any] = [ "statusView": statusView ]
        
        containerView.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[statusView]|",
                                                    options: NSLayoutFormatOptions(),
                                                    metrics: nil,
                                                      views: viewBindings)
        )
        
        containerView.addConstraints(
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[statusView]|",
                                                    options: NSLayoutFormatOptions(),
                                                    metrics: nil,
                                                      views: viewBindings)
        )
        
        containerView.bringSubview(toFront: statusView)
        
    }
    
}
