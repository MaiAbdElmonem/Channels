//
//  HomeDataSource.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/20/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import IGListKit

class HomeDataSource: NSObject, ListAdapterDataSource {
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return HomeConstants.objects
  }
  
  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    if object is EpisodesHeader {
        return SectionHeader()
    } else {
        return ChannelSection()
    }
  }
  
  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
  
}
