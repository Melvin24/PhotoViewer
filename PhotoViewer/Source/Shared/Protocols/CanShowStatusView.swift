//
//  CanShowStatusView.swift
//  PhotoViewer

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
