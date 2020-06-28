//
//  Home.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

struct ResponseData: Codable {
    let media: [Media]?
    let channels: [Channel]?
    let categories: [Category]?
  
  init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      channels = try values.decodeIfPresent([Channel].self, forKey: .channels)
      media = try values.decodeIfPresent([Media].self, forKey: .media)
      categories = try values.decodeIfPresent([Category].self, forKey: .categories)
  }

}
