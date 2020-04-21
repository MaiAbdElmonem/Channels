//
//  Home.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

struct HomeDataClass: Codable, Hashable {
    let media: [Media]?
    let channels: [Channels]?
    let categories: [Category]?
    let identifier = UUID()

    func hash(into hasher: inout Hasher) {
                 return hasher.combine(identifier)
             }

    static func == (lhs: HomeDataClass, rhs: HomeDataClass) -> Bool {
                 return lhs.identifier == rhs.identifier
       }
  
}

struct ApiData: Codable, Hashable {
  let data: HomeDataClass
}
