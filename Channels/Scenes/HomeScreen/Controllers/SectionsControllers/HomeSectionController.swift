//
//  HomeSectionController.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 6/5/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import IGListKit

class HomeSectionController: ListSectionController {
  var data: Section!
  var embeddedSectionDataSource = HorizontalCollectionViewAdapter()
  lazy var adapter: ListAdapter = {
      let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                viewController: self.viewController)
      adapter.dataSource = embeddedSectionDataSource
    embeddedSectionDataSource.add(item: data)
      return adapter
  }()
  
  override init() {
          super.init()
          supplementaryViewSource = self
      }
  
  func getSectionHeaderType() -> [Any]? {
    data?.headers
  }
  
  func getSectionType() -> [Any]? {
    data?.items
  }
  
  override func numberOfItems() -> Int {
    if let categories = getSectionType() as? [Category] {
      return categories.count
    } else {
      return 1
    }
  }
  
  override func cellForItem(at index: Int) -> UICollectionViewCell {
    if ((getSectionType() as? [Media]) != nil) {
      guard let cell = collectionContext?.dequeueReusableCell(of: HorizontalCollectionViewCell.self, for: self,
                                                              at: index) as? HorizontalCollectionViewCell else {
                                                                fatalError("collectionView cell failed")
      }
      adapter.collectionView = cell.horizontalCollectionView
      return cell
    }
    
    if ((getSectionType() as? [Category]) != nil) {
      guard let cell = collectionContext?.dequeueReusableCell(
        of: CategoryCollectionViewCell.self,
        for: self, at: index) as? CategoryCollectionViewCell else {
          fatalError("categories cell failed")
      }
      guard let categories = data?.items?[index] as? Category else { return UICollectionViewCell() }
      cell.configure(model: categories)
      return cell
    }
    return UICollectionViewCell()
  }
  
  override func sizeForItem(at index: Int) -> CGSize {
    let width = collectionContext?.containerSize.width ?? 0
    let height = collectionContext?.containerSize.height ?? 0
    if let sectionType = getSectionType() as? [Media] {
      self.inset = UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 0)
      if sectionType.first?.type == "video" {
        return CGSize(width: width * 2, height: height / 2.5)
      } else {
        return CGSize(width: width, height: height / 2)
      }
    }
    if (getSectionType() as? [Category]) != nil {
      self.inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
      self.minimumLineSpacing = 20
        let widthItem = ((width - 50) / 2) - 8
          return CGSize(width: widthItem + 12, height: widthItem / 2)
    }
    return CGSize(width: width, height: height)
  }
  
  override func didUpdate(to object: Any) {
        data = object as? Section
  }
}
