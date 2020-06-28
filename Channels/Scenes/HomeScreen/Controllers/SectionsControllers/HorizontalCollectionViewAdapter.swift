//
//  HorizontalCollectionViewAdapter.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 6/5/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import IGListKit

class HorizontalCollectionViewAdapter: NSObject, ListAdapterDataSource {
  var data: Section?
   var list = [Section]()
  func add(item: Section) {
    self.list.append(item)
  }
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return list 
  }
  
  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    return EmbeddedSectionController()
  }
  
  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }

}
