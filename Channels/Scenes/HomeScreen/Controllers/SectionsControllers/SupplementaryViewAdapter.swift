//
//  SupplementaryViewAdapter.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 6/6/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import IGListKit

extension HomeSectionController: ListSupplementaryViewSource {
  func supportedElementKinds() -> [String] {
    return [UICollectionView.elementKindSectionHeader, UICollectionView.elementKindSectionFooter]
  }
  
  func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
    switch elementKind {
    case UICollectionView.elementKindSectionHeader:
      return homeHeaderView(atIndex: index)
    case UICollectionView.elementKindSectionFooter:
      return homeFooterView(atIndex: index)
    default:
      fatalError("cant get header or footer")
    }
  }
  
  func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
    let width = collectionContext?.containerSize.width ?? 0
    return CGSize(width: width, height: 70)
  }
  
  private func homeHeaderView(atIndex index: Int) -> UICollectionReusableView {
    guard let view = collectionContext?.dequeueReusableSupplementaryView(
      ofKind: UICollectionView.elementKindSectionHeader,
      for: self, class: HeaderView.self, at: index)
      as? HeaderView else {
        fatalError("No section header")
    }
    
    if ((getSectionHeaderType() as? [Media]) != nil) {
      view.configureEpisodeHeader()
      return view
      
    } else if ((getSectionHeaderType() as? [Category]) != nil) {
      view.configureCategoryHeader()
      return view
      
    } else {
      guard let channelHeaders = getSectionHeaderType()?[index] as? Channel else { return UICollectionViewCell() }
      view.configure(model: channelHeaders)
      return view
    }
  }
  
  private func homeFooterView(atIndex index: Int) -> UICollectionReusableView {
    guard let view = collectionContext?.dequeueReusableSupplementaryView(
      ofKind: UICollectionView.elementKindSectionFooter,
      for: self, class: FooterView.self, at: index)
      as? FooterView else {
        fatalError("No Footer")
    }
    return view
  }
}
