//
//  LatestMedia.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
struct LatestMedia: Codable, Hashable {
  let type: String?
  let title: String?
  let coverAsset: CoverAsset?
  let identifier = UUID()
  
  func hash(into hasher: inout Hasher) {
                  return hasher.combine(identifier)
              }
              
     static func == (lhs: LatestMedia, rhs: LatestMedia) -> Bool {
                  return lhs.identifier == rhs.identifier
        }

}
