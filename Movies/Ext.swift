//
//  Ext.swift
//  Movies
//
//  Created by zmobile on 25/11/22.
//

import Foundation
import UIKit
import CoreGraphics
import IOSReusableCV

extension ReusableCVLayout{
    ///initalizer to initialize layout for vertical CV with respective column
    convenience public init(forVerticalLayoutNumberOfColumn column: Float, heightMultiplier:CGFloat = 1.0, minimumInteritemSpacing: CGFloat = 10, minimumLineSpacing: CGFloat = 10, sectionInset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)) {
    self.init()
    self.cellPerColumn = column
    self.cellsPerRow = 0
    self.scrollDirection = scrollDirection
    self.minimumInteritemSpacing = minimumInteritemSpacing
    self.minimumLineSpacing = minimumLineSpacing
    self.sectionInset = sectionInset
   
   }
    
    ///initalizer to initialize layout for  horizontal CV with respective row
    convenience public init(forHorizontalLayoutNumberOfRow row: Float , widthMultiplier:CGFloat , minimumInteritemSpacing: CGFloat = 10, minimumLineSpacing: CGFloat = 10, sectionInset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)) {
    self.init()
    self.cellsPerRow = row
    self.cellPerColumn = 0
    self.scrollDirection = scrollDirection
    self.minimumInteritemSpacing = minimumInteritemSpacing
    self.minimumLineSpacing = minimumLineSpacing
    self.sectionInset = sectionInset
  
   }

override public func prepare() {
    super.prepare()

    guard let collectionView = collectionView else { return }
    let marginsAndInsets = sectionInset.left + sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellPerColumn - 1)
  
    let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellPerColumn)).rounded(.down)
    
    let marginsAndInsets1 = sectionInset.top + sectionInset.bottom + collectionView.safeAreaInsets.top + collectionView.safeAreaInsets.bottom + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)

    let itemHeight = ((collectionView.bounds.size.height - marginsAndInsets1) / CGFloat(cellsPerRow)).rounded(.down)

    if cellsPerRow == 0{
        itemSize = CGSize(width: itemWidth, height: itemWidth)
    }
    else if cellPerColumn == 0 {
        itemSize = CGSize(width: itemHeight, height: itemHeight)
    }
    else {
    itemSize = CGSize(width: itemWidth, height: itemHeight)
    }
}

}
