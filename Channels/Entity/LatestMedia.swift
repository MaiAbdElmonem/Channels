//
//  LatestMedia.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 6/6/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

struct LatestMedia: Codable {
  let coverAsset: CoverAsset?
  let title: String?
  let type: String?
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    coverAsset = try values.decodeIfPresent(CoverAsset.self, forKey: .coverAsset)
    title = try values.decodeIfPresent(String.self, forKey: .title)
    type = try values.decodeIfPresent(String.self, forKey: .type)
  }
}
