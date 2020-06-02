//
//  HomeConstants.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/20/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import UIKit

class HomeConstants {
//   var data: [Any] = [
//          HomeSection.requirements.rawValue,
//          HomeSection.news.rawValue
//      ]
  let dataCategories: CategoryList = [
     .init(categoryName: "Career"),
     .init(categoryName: "Emotional"),
     .init(categoryName: "Health & Fitness"),
     .init(categoryName: "Character"),
     .init(categoryName: "Financial")
   ]
  
  func dataCategoriesCount() -> Int {
    return dataCategories.count
  }
      
  }

//  static let objects: [ListDiffable] = [EpisodesHeader(description: "91", title: "header one", image: #imageLiteral(resourceName: "Channels - Design 2")),
//                                        ChannelsSection(subTitle: "channel one",
//                                                        title: "channel one",
//                                                        image: Asset.channelsDesign2.image),
//                                        EpisodesHeader(description: "92", title: "header two",
//                                                       image: #imageLiteral(resourceName: "Channels - Design 3")),
//                                        ChannelsSection(subTitle: "channel two",
//                                                        title: "channel two",
//                                                        image: Asset.channelsDesign3.image),
//                                        EpisodesHeader(description: "93", title: "header three",
//                                                       image: #imageLiteral(resourceName: "Channels - Design 4")),
//                                        ChannelsSection(subTitle: "channel three",
//                                                        title: "channel three", image: Asset.channelsDesign4.image)
//
//  ]
//}
