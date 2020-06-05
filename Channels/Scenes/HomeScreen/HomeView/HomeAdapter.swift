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
  var categoriesSection = [MyStruct<Category>(property: [])]
  var eposidesSection = MyStruct<Media>(property: [])
  var models = [ListDiffable]()
  
  var list = [Section]()
  func ass(items: [MyStruct<Category>]) {
    
  }
  
  func adds(items: [AnyObject]) {
    self.models.append(contentsOf: categoriesSection)
//    self.models.append(eposidesSection)
  }
  func add(item: Section) {}
  
  func add(items: [Section]) {
    self.list.append(contentsOf: items)
  }
    
  func count() -> Int {
    return list.count 
  }
  
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return models
  }
  
  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    if object is MyStruct<Category> {
      return CategoriesSectionController()
    } else if object is MyStruct<Media> {
      print("med")
    }
      return ListSectionController()

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
