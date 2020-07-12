//
//  HomeDataSource.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/20/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import IGListKit
import UIKit

class HomeAdapter: NSObject, ListAdapterDataSource {
  var list = [Section]()
  
  func add(items: [Section]) {
    self.list.append(contentsOf: items)
  }
  
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return list
  }
  
  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    if object is Section {
      return HomeSectionController()
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

//  func adds(items: [AnyObject]) {
//    self.data.append(contentsOf: categoriesSection)
//    self.data.append(eposidesSection)
//  }
