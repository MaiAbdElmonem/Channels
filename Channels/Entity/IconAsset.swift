//
//  IconAsset.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

struct IconAsset: Codable {
  let thumbnailUrl: String?
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
  }

}
