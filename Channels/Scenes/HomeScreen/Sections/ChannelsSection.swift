//
//  ChannelsSection.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/20/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import IGListKit

class ChannelsSection: ListDiffable {
  private var identifier: String = UUID().uuidString
     private(set) var subTitle: String
     private(set) var title: String
     private(set) var image: UIImage
     
   init(subTitle: String, title: String, image: UIImage) {
         self.subTitle = subTitle
         self.title = title
         self.image = image
     }
     
     func diffIdentifier() -> NSObjectProtocol {
         return identifier as NSString
     }
     
     func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
         guard let object = object as? ChannelsSection else {
             return false
         }
         return self.identifier == object.identifier
     }
}
