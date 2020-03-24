//
//  NetworkDefaults.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 3/24/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

struct NetworkDefaults {
  var baseUrl: String?
  var apiKey: String?
  var language: String?
  static var `defaults` : NetworkDefaults {
    let instance = NetworkDefaults()
    return instance
  }
}
