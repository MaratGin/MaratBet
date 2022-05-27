//
//  StatisticsLayout.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 26.05.2022.
//
// swiftlint:disable all


import Foundation
import UIKit

struct StatisticsLayoutConstants {
  struct Cell {
    static let standardHeight: CGFloat = 150
    static let featuredHeight: CGFloat = 300
  }
}

// MARK: Properties and Variables

class StatisticsLayout: UICollectionViewLayout {
  let dragOffset: CGFloat = 170.0
  
  var cache: [UICollectionViewLayoutAttributes] = []
  
  var featuredItemIndex: Int {
    return max(0, Int(collectionView!.contentOffset.y / dragOffset))
  }
  
  var nextItemPercentageOffset: CGFloat {
    guard let collectionView = collectionView else {
      return 0
    }
    return (collectionView.contentOffset.y / dragOffset) - CGFloat(featuredItemIndex)
  }
  
  var width: CGFloat {
    
    return collectionView!.bounds.width
  }
  
  var height: CGFloat {
    return collectionView!.bounds.height
  }
  
  var numberOfItems: Int {
    return collectionView!.numberOfItems(inSection: 0)
  }
}

// MARK: UICollectionViewLayout

extension StatisticsLayout {
  override var collectionViewContentSize : CGSize {
    let contentHeight = (CGFloat(numberOfItems) * dragOffset) + (height - dragOffset)
    return CGSize(width: width, height: contentHeight)
  }
  
  override func prepare() {
    print(1)
    cache.removeAll(keepingCapacity: false)
    
    let standardHeight = StatisticsLayoutConstants.Cell.standardHeight
    let featuredHeight = StatisticsLayoutConstants.Cell.featuredHeight
  
    var frame = CGRect.zero
    var y: CGFloat = 0
    
    for item in 0..<numberOfItems {
      let indexPath = IndexPath(item: item, section: 0)
      let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
      attributes.zIndex = item
      var height = standardHeight
      if indexPath.item == featuredItemIndex {
        let yOffset = standardHeight * nextItemPercentageOffset
        y = collectionView!.contentOffset.y - yOffset
        height = featuredHeight
      } else if indexPath.item == (featuredItemIndex + 1) && indexPath.item != numberOfItems {
        let maxY = y + standardHeight
        height = standardHeight + max((featuredHeight - standardHeight) * nextItemPercentageOffset, 0)
        y = maxY - height
      }
      frame = CGRect(x: 0, y: y, width: width, height: height)
      attributes.frame = frame
      cache.append(attributes)
      y = frame.maxY
    }
  }
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var layoutAttributes: [UICollectionViewLayoutAttributes] = []
    print(2)

    for attributes in cache {
      if attributes.frame.intersects(rect) {
        layoutAttributes.append(attributes)
      }
    }
    return layoutAttributes
  }
  override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
    let itemIndex = round(proposedContentOffset.y / dragOffset)
    let yOffset = itemIndex * dragOffset
    return CGPoint(x: 0, y: yOffset)
  }
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
}
