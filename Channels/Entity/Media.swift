//
//  LatestMedia.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

struct Media: Codable {
  let coverAsset: CoverAsset?
  let title: String?
  let type: String?
  let channel: Channel?

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    coverAsset = try values.decodeIfPresent(CoverAsset.self, forKey: .coverAsset)
    title = try values.decodeIfPresent(String.self, forKey: .title)
    type = try values.decodeIfPresent(String.self, forKey: .type)
    channel = try values.decodeIfPresent(Channel.self, forKey: .channel)
  }
}
