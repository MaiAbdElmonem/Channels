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

class HomeDataSource: NSObject, ListAdapterDataSource {
  
  var list = [Section]()
  
  func add(item: Section) {}
  
  func add(items: [Section]) {
//    for sec in items {
//      if let sss = sec.items {
    self.list.append(contentsOf: items)
//    self.adapter?.performUpdates(animated: true, completion: nil)
  }
    
  func count() -> Int {
    return list.count 
  }
  
  func getSectionType() -> [Any] {
    guard let sectionTypes = list.first?.items else { return [] }
    return sectionTypes
  }
  
//  let data: [Any] = [
//   1,
//   2
//   ]
//  let objects: [ListDiffable] = [
//    CatListDiffable(text: "Career"),
//    CatListDiffable(text: "Emotional"),
//    CatListDiffable(text: "Health & Fitness"), CatListDiffable(text: "Character"),
//    CatListDiffable(text: "Financial")]
//  var vmObj = HomeConstants()
  
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return list
  }
  
  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    let sectionType = self.getSectionType()
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

