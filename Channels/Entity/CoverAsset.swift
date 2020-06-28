//
//  CoverAsset.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

struct CoverAsset: Codable {
  let url: String?
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    url = try values.decodeIfPresent(String.self, forKey: .url)
  }
}
