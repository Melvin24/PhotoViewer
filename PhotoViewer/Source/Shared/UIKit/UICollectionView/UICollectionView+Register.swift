//
//  UICollectionView+Register.swift
//  PhotoViewer

import UIKit

extension UICollectionView {
    
    /// Convenience function to register cells from nib.
    ///
    /// - parameter nib:    The class type to register. e.g. `MyCellClass.self`
    /// - parameter bundle: The bundle in which to search for the nib file. If you specify nil, this method looks for the nib file in the main bundle.
    public func register(nib: Reuseable.Type, bundle: Bundle? = nil) {
        register(UINib(nibName: classNameFromType(nib), bundle: bundle), forCellWithReuseIdentifier: nib.defaultReuseIdentifier)
    }
    
    /// Convenience function to unwrap the cell using the defaultReuseIdentifier available on `UICollectionReusableView`.
    ///
    /// - parameter type:      The class type, must be a subclass of `UICollectionViewCell`
    /// - parameter indexPath: the currrent indexPath to query the collection view cache
    ///
    /// - returns: A dequeued cell.
    public func dequeueReusableCell<T: UICollectionViewCell>(type: T.Type, forIndexPath indexPath: IndexPath) -> T {
        // swiftlint:disable force_cast
        return dequeueReusableCell(withReuseIdentifier: type.defaultReuseIdentifier, for: indexPath) as! T
        // swiftlint:enable force_cast
    }
    
    /// Convenience function to register supplemetary view from nib.
    ///
    /// - parameter nib:         The class type to register. e.g. `MySupplementaryViewClass.self`
    /// - parameter elementKind: The kind of supplementary view to locate.
    /// - parameter bundle:      The bundle in which to search for the nib file. If you specify nil, this method looks for the nib file in the main bundle.
    public func register(nib: Reuseable.Type, ofKind elementKind: String, bundle: Bundle? = nil) {
        register(UINib(nibName: classNameFromType(nib), bundle: bundle), forSupplementaryViewOfKind: elementKind, withReuseIdentifier: nib.defaultReuseIdentifier)
    }
    
    /// Convenience function to unwrap the cell using the defaultReuseIdentifier available on `UICollectionViewCell`.
    ///
    /// - parameter elementKind: The kind of supplementary view to locate.
    /// - parameter type:        The class type, must be a subclass of `UICollectionViewReusableView`
    /// - parameter indexPath:   The currrent indexPath to query the collection view cache
    ///
    /// - returns: This method always returns a valid supplementary view.
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind elementKind: String, type: T.Type, forIndexPath indexPath: IndexPath) -> T {
        // swiftlint:disable force_cast
        return dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: type.defaultReuseIdentifier, for: indexPath) as! T
        // swiftlint:enable force_cast
    }
}
