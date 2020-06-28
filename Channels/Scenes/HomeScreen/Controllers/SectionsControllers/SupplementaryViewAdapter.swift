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
    if ((getSectionType() as? [Category]) != nil) {
      guard let view = collectionContext?.dequeueReusableSupplementaryView(
        ofKind: UICollectionView.elementKindSectionHeader,
        for: self, nibName: "HeaderView", bundle: nil,
        at: index) as? HeaderView else {
          fatalError("no categories section header")
      }
      view.titleLabel.text = "Browse by categories"
      view.subtitleLabel.isHidden = true
      return view
    }
    if ((getSectionType() as? [Media]) != nil) {
      guard let view = collectionContext?.dequeueReusableSupplementaryView(
        ofKind: UICollectionView.elementKindSectionHeader,
        for: self, nibName: "HeaderView", bundle: nil,
        at: index) as? HeaderView else {
          fatalError("no categories section header")
      }
      guard let mediaHeaders = data.items?[index] as? Media else { return UICollectionViewCell() }
      view.configureHeader(sectionType: mediaHeaders)           
      return view
    }
    return UICollectionReusableView()
  }
  
  private func homeFooterView(atIndex index: Int) -> UICollectionReusableView {
    guard let view = collectionContext?.dequeueReusableSupplementaryView(
      ofKind: UICollectionView.elementKindSectionHeader,
      for: self, nibName: "FooterView", bundle: nil,
      at: index) as? FooterView else {
        fatalError("no categories section header")
    }
    return view
  }
}
