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

final class EmbeddedSectionController: ListSectionController {
    var eposides: Section?
  
    override init() {
        super.init()
      self.minimumLineSpacing = 25
    }
  override func numberOfItems() -> Int {
            if let sss = eposides?.items as? [Media] {
              return sss.count
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
      guard let cell = collectionContext?.dequeueReusableCell(withNibName: "EpisodesCollectionViewCell", bundle: nil,
                                                              for: self,
                                                              at: index) as? EpisodesCollectionViewCell else {
                  fatalError("err in episode cell")
      }
        guard let media = eposides?.items?[index] as? Media else { return UICollectionViewCell() }

        cell.configure(with: media)
               return cell
  }
    override func didUpdate(to object: Any) {
          eposides = object as? Section
    }
    
}
