//
//  HomeDataSource.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/20/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import IGListKit
import UIKit
import Foundation

class HomeAdapter: NSObject, ListAdapterDataSource {
  
  var list = [Section]()
  
  func add(item: Section) {}
  
  func add(items: [Section]) {
    self.list.append(contentsOf: items)
  }
    
  func count() -> Int {
    return list.count 
  }
  
  func getSectionType() -> [Any] {
    guard let sectionTypes = list.first?.items else { return [] }
    return sectionTypes
  }
  
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return list
  }
  
  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    let sectionType = self.getSectionType()
    for item in list {
      if (item.items?.firstIndex(where: { $0 as AnyObject === Media.self as AnyObject})) != nil {
        print("0")
      }
      if (item.items?.firstIndex(where: { $0 as AnyObject === Category.self as AnyObject})) != nil {
        print("1")
      }
    }
//    if sectionType.index(0, offsetBy: 0) {
    if object is Section {
      if sectionType is [Media] {
        return EpisodesSectionController()
      }
      if sectionType is [Category] {
        return CategoriesSectionController()
      } else {
        return ListSectionController()
      }
    } else {
      return ListSectionController()
    }
  }
  
  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
  
}
//  var adapter: ListAdapter?
//  init(view: UIViewController, collectionView: UICollectionView) {
//    adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: view)
//    super.init()
//    adapter?.collectionView = collectionView
//    adapter?.dataSource = self
//  }
