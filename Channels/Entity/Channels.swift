//
//  Channels.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

struct Channels: Hashable, Codable {
  let sectionType: SectionType = .channels
  let identifier = UUID()
  let title: String
  let series: [Series]?
  let mediaCount: Int?
  let latestMedia: [LatestMedia]? 
  let id: String?
  let iconAsset: IconAsset?
  let coverAsset: CoverAsset?

      func hash(into hasher: inout Hasher) {
                return hasher.combine(id)
            }
  
            static func == (lhs: Channels, rhs: Channels) -> Bool {
                return lhs.identifier == rhs.identifier
      }
}

struct Series: Codable {
    let title: String
    let coverAsset: CoverAsset
    let id: String?
}

struct MediaType: Hashable {
    let sectionType: SectionType = .newEpisodes
    let title = "New Episodes"
    let media: [Media]
    
    let identifier = UUID()
          
    func hash(into hasher: inout Hasher) {
                 return hasher.combine(identifier)
             }
             
    static func == (lhs: MediaType, rhs: MediaType) -> Bool {
                 return lhs.identifier == rhs.identifier
       }
}

struct Media: Codable, Hashable {
    let type: String
    let title: String
    let image: String // images
    let channel: Channels
    let identifier = UUID()
          
    func hash(into hasher: inout Hasher) {
                 return hasher.combine(identifier)
             }
             
    static func == (lhs: Media, rhs: Media) -> Bool {
                 return lhs.identifier == rhs.identifier
       }
}
