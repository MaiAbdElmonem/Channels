//
//  ChannelSection.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/20/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import IGListKit

class ChannelSection: ListSectionController {
  var currentChannel: ChannelsSection?
  
  override func didUpdate(to object: Any) {
     guard let superHero = object as? ChannelsSection else {
               return
           }
           currentChannel = superHero
  }
  
  override func numberOfItems() -> Int {
    return 3
  }
  
  override func cellForItem(at index: Int) -> UICollectionViewCell {
      guard let ctx = collectionContext else {
                 return UICollectionViewCell()
             }
             let nibName = String(describing: HomeCollectionViewCell.self)
             let cell = ctx.dequeueReusableCell(withNibName: nibName, bundle: nil, for: self, at: index)
    if currentChannel != nil {
      (cell as? HomeCollectionViewCell)?
        .configure(title: currentChannel?.title ?? "",
                   subTitle: currentChannel?.subTitle ?? "", image: currentChannel?.image ?? Asset.group1.image)
             }
             return cell
  }
  
  override func sizeForItem(at index: Int) -> CGSize {
      guard let context = collectionContext else {
        return .zero
      }
      let width = context.containerSize.width
     return CGSize(width: width, height: 400)
  }
}
