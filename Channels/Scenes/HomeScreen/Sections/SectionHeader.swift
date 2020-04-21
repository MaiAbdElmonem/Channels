//
//  SectionHeader.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/20/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit
import IGListKit

class SectionHeader: ListSectionController {
  var currentEpisode: EpisodesHeader?
  
  override func didUpdate(to object: Any) {
      guard let header = object as? EpisodesHeader else {
                 return
             }
             currentEpisode = header
  }
  
  override func numberOfItems() -> Int {
    return 3
  }
  
  override func sizeForItem(at index: Int) -> CGSize {
    let width = collectionContext?.containerSize.width ?? 0
    return CGSize(width: width, height: 125)
  }
  
  override func cellForItem(at index: Int) -> UICollectionViewCell {
     guard let ctx = collectionContext else {
               return UICollectionViewCell()
           }
           let nibName = String(describing: HeaderCollectionViewCell.self)
           let cell = ctx.dequeueReusableCell(withNibName: nibName, bundle: nil, for: self, at: index)
            if currentEpisode != nil {
            (cell as? HeaderCollectionViewCell)?.configure(
              title: currentEpisode?.title ?? "m",
              image: #imageLiteral(resourceName: "Channels - Design 2"), episodeNo: 95,
              showEpisodeView: true)
           }
           return cell
  }
  
}
