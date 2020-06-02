//
//  EpisodesSectionController.swift
//  IGListExample
//
//  Created by Mai Abd Elmonem on 4/28/20.
//  Copyright © 2020 Rohmts. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

class EpisodesSectionController: ListSectionController {
   var data: Section?
  
  lazy var adapter: ListAdapter = {
         let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                   viewController: self.viewController)
         adapter.dataSource = self
         return adapter
     }()
  
  override init() {
         super.init()
         self.inset = UIEdgeInsets(top: 5, left: 30, bottom: 0, right: 0)
     }
  
  override func sizeForItem(at index: Int) -> CGSize {
    let width = collectionContext?.containerSize.width ?? 0
    let height = collectionContext?.containerSize.height ?? 0
    return CGSize(width: width, height: height / 2)
     }
  
  override func didUpdate(to object: Any) {
    data = object as? Section
  }
  
  override func cellForItem(at index: Int) -> UICollectionViewCell {
       guard let cell = collectionContext?.dequeueReusableCell(of: HorizontalCollectionViewCell.self, for: self,
                                                               at: index) as? HorizontalCollectionViewCell else {
                                                                         fatalError("collectionView cell failed")
             }
    adapter.collectionView = cell.horizontalCollectionView
             return cell
  }
}
  
extension EpisodesSectionController: ListAdapterDataSource {
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return [data] as? [ListDiffable] ?? []
  }
  
  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    return EmbeddedSectionController()
  }
  
  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}

final class EmbeddedSectionController: ListSectionController {
    var eposides: Section?
  
    override init() {
        super.init()
      self.minimumLineSpacing = 25
    }
  override func numberOfItems() -> Int {
    if let episodes = eposides?.items as? [Media] {
      return episodes.count
    } else if let channels = eposides?.items as? [Channel] {
      return channels.count
    } else {
      return 0
    }
  }
    
    override func sizeForItem(at index: Int) -> CGSize {
      let width = collectionContext?.containerSize.width ?? 0
      let height = collectionContext?.containerSize.height ?? 0
      return CGSize(width: width / 2, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
      if (eposides?.items as? [Media]) != nil {
      guard let cell = collectionContext?.dequeueReusableCell(withNibName: "EpisodesCollectionViewCell", bundle: nil,
                                                              for: self,
                                                              at: index) as? EpisodesCollectionViewCell else {
                  fatalError("err in episode cell")
      }
        guard let media = eposides?.items?[index] as? Media else { return UICollectionViewCell() }

        cell.configure(with: media)
               return cell
      } else {
        let sss = eposides?.items as? [Channel]
        let get = sss?.first?.latestMedia?.first?.type == "video"
          guard let cell = collectionContext?.dequeueReusableCell(withNibName: "SeriesCollectionViewCell", bundle: nil,
                                                                  for: self,
                                                                  at: index) as? SeriesCollectionViewCell else {
                         fatalError("err in series cell")
             }
               guard let channels = eposides?.items?[index] as? Media else { return UICollectionViewCell() }

               cell.configure(with: channels)
                      return cell
      }
  }
    override func didUpdate(to object: Any) {
       eposides = object as? Section
    }
    
}
