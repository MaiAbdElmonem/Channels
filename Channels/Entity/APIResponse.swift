//
//  APIResponse.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/16/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

struct APIResponse<T: Codable>: Codable {
  
  var status: Int?
  var isSuccess: Bool?
  var data: T?
  var error: NetworkError?
  
  enum CodingKeys: String, CodingKey {
    case status
    case isSuccess
    case data
    case error
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    status = try values.decodeIfPresent(Int.self, forKey: .status)
    isSuccess = try values.decodeIfPresent(Bool.self, forKey: .isSuccess)
    data = try values.decodeIfPresent(T.self, forKey: .data)
    error = try values.decodeIfPresent(NetworkError.self, forKey: .error)
  }
}
