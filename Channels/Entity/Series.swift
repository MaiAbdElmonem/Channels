//
//  Series.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/11/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

struct Series: Codable {
  let coverAsset: CoverAsset?
  let title: String?
  let url: String?

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    coverAsset = try CoverAsset(from: decoder)
    title = try values.decodeIfPresent(String.self, forKey: .title)
    url = try values.decodeIfPresent(String.self, forKey: .url)
  }
}
