//
//  UICollectionView+CellSize.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 02/10/2021.
//

import UIKit

public extension UICollectionViewFlowLayout {
    
    enum CellSize {
        case fullWidth(height: CellHeight)
        case halfWidth(height: CellHeight)
        case thirdWidth(height: CellHeight)
        case quarterWidth(height: CellHeight)
        case multiItem(items: CGFloat, height: CellHeight)
        case custom(size : CGSize)
    }
    
    enum CellHeight {
        case singleItem
        case multiItem(items: CGFloat)
        case custom(height: CGFloat)
    }
    
    func getCellSize(size: CellSize) -> CGSize
    {
        guard let collectionView = collectionView else {return CGSize(width: 0, height: 0)}
        switch size {
        case .fullWidth(height: let h):
            return CGSize(width: collectionView.bounds.width, height: getCellHeight(height: h))
        case .halfWidth(height: let h):
            return CGSize(width: collectionView.bounds.width / 2, height: getCellHeight(height: h))
        case .thirdWidth(height: let h):
            return CGSize(width: collectionView.bounds.width / 3, height: getCellHeight(height: h))
        case .quarterWidth(height: let h):
            return CGSize(width: collectionView.bounds.width / 4, height: getCellHeight(height: h))
        case .multiItem(items: let i, height: let h):
            return CGSize(width: itemSize.width * i, height: getCellHeight(height: h))
        case .custom(size: let s):
            return s
        }
    }
    
    func getCellHeight(height: CellHeight) -> CGFloat
    {
        switch height {
        case .singleItem:
            return itemSize.height
        case .multiItem(items: let i):
            return itemSize.height * CGFloat(i)
        case .custom(height: let h):
            return h
        }
    }
}
