//
//  Channels.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

struct Channel: Codable {
    let coverAsset: CoverAsset?
    let iconAsset: IconAsset?
    let id: String?
    let latestMedia: [Media]?
    let mediaCount: Int?
    let series: [Series]?
    let title: String?
  
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      iconAsset = try values.decodeIfPresent(IconAsset.self, forKey: .iconAsset)
      coverAsset = try values.decodeIfPresent(CoverAsset.self, forKey: .coverAsset)
      id = try values.decodeIfPresent(String.self, forKey: .id)
      latestMedia = try values.decodeIfPresent([Media].self, forKey: .latestMedia)
      mediaCount = try values.decodeIfPresent(Int.self, forKey: .mediaCount)
      series = try values.decodeIfPresent([Series].self, forKey: .series)
      title = try values.decodeIfPresent(String.self, forKey: .title)
    }
 
}
