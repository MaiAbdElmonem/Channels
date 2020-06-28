//
//  Category.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

struct Category: Codable {
    let name: String?
  
    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
