//
//  HomeService.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/16/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import Moya

//swiftlint:disable  force_unwrapping

enum  HomeService {
  case channel
  case categories
  case episodes
}
var dddm: NetworkManager = {
   return NetworkManager()
 }()

extension HomeService: TargetType {
 
  var baseURL: URL {
    return URL(string: dddm.networkConfig.baseUrl)!
  }
  
  var path: String {
    switch self {
    case .channel:
      return "Xt12uVhM"
    case .categories:
      return "A0CgArX3"
    case .episodes:
      return "z5AExTtw"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .categories, .channel, .episodes:
      return .get
    }
  }
  
  var sampleData: Data {
    switch self {
    case .categories, .channel, .episodes:
      return Data()
    }
  }
  
  var task: Task {
    switch self {
    case .categories, .channel, .episodes:
      return .requestParameters(parameters: ["": ""], encoding: URLEncoding.default)
    }
  }
  
  var headers: [String: String]? {
    return nil
  }
  
}
