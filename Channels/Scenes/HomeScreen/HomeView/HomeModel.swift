//
//  HomeModel.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/17/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import Moya

class HomeModel: BaseModel, HomeModelProtocol {
  
//   to get generic model
//  func get(target: TargetType, completion: @escaping (Result<ResponseData, NetworkError>) -> Void) {
//    NetworkManager.shared.genericFetch(
//      target: target, completion: { (result: Result<APIResponse<ResponseData>, NetworkError>, _) in
//        do {
//          if let res = try result.get().data {
//          completion(.success(res))
//          }
//        } catch {
//          completion(.failure(NetworkError.parseError))
//        }
//      })
//  }
  
  func getChannels() -> [Channel] {
    if let path = Bundle.main.path(forResource: "Channels.Success", ofType: "json") {
      let decoder = JSONDecoder()
      do {
        guard let data = try? String(contentsOfFile: path).data(using: .utf8) else { return [Channel]() }
        let dataStored = try decoder.decode(APIResponse<ResponseData>.self, from: data)
        guard let channels = dataStored.data?.channels else { return [Channel]() }
        return channels
      } catch let error {
        print("parse error: \(error)")
      }
    } else {
      print("Invalid filename/path.")
    }
    return [Channel]()
  }
  
  func getEpisodes() -> [Media] {
    if let path = Bundle.main.path(forResource: "Episodes.Success", ofType: "json") {
      let decoder = JSONDecoder()
      do {
        guard let data = try? String(contentsOfFile: path).data(using: .utf8) else { return [Media]() }
        let dataStored = try decoder.decode(APIResponse<ResponseData>.self, from: data)
        guard let media = dataStored.data?.media else { return [Media]() }
        return media
      } catch let error {
        print("parse error: \(error.localizedDescription)")
      }
    } else {
      print("Invalid filename/path.")
    }
    return [Media]()
  }
  
  func getCategories() -> [Category] {
    if let path = Bundle.main.path(forResource: "Category.Success", ofType: "json") {
      let decoder = JSONDecoder()
      do {
        guard let data = try? String(contentsOfFile: path).data(using: .utf8) else { return [Category]() }
        let dataStored = try decoder.decode(APIResponse<ResponseData>.self, from: data)
        guard let categories = dataStored.data?.categories else { return [Category]() }
        return categories
      } catch let error {
        print("parse error: \(error.localizedDescription)")
      }
    } else {
      print("Invalid filename/path.")
    }
    return [Category]()
  }
}
