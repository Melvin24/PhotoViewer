//
//  PhotoViewerLayout.swift
//  PhotoViewer

import UIKit

protocol UICollectionViewGridLayoutDelegate: class {
    
    /// Calculate the height of a cell based on a fixed width
    ///
    /// - Parameters:
    ///   - collectionView: The collectionView the layout is for
    ///   - indexPath: The indexPath of the item in which the height needs to be calculated for
    ///   - width: The fixed width of the cell
    /// - Returns: The height of the cell
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat
    
}

class PhotoViewerLayout: UICollectionViewLayout {
    
    weak var delegate: UICollectionViewGridLayoutDelegate!

    var cache = [UICollectionViewLayoutAttributes]()

    var contentHeight: CGFloat = 0
    
    var numberOfColumns = 2
    var cellPadding: CGFloat = 6
    
    var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            fatalError("Layout has no collectionView property")
        }
        
        let insets = collectionView.contentInset
        return collectionView.bounds.width - insets.left - insets.right
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        super.prepare()
        
        guard cache.isEmpty else { return }
        
        guard let collectionView = collectionView else {
            fatalError("Layout has no collectionView property")
        }

        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset = [CGFloat]()
        for column in 0 ..< numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
        
        // 3
        for item in 0 ..< collectionView.numberOfItems(inSection: 1) {
            
            let indexPath = IndexPath(item: item, section: 1)
            
            // 4
            let photoHeight = delegate.collectionView(collectionView, heightForPhotoAtIndexPath: indexPath)
            let height = cellPadding * 2 + photoHeight
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            // 5
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            // 6
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        // Loop through the cache and look for items in the rect
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
