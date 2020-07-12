//
//  HomeModel.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/17/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import Moya
import PromiseKit

class HomeModel: BaseModel, HomeModelProtocol {
  func getChannels() -> Promise<[Channel]> {
    return Promise { seal in
      NetworkManager.shared.request(HomeService.channel).done {(result: APIResponse<ResponseData>) in
        guard let channels = result.data?.channels
          else { return }
        seal.fulfill(channels)
      }.catch { error in
        print(error)
        seal.reject(NetworkError.parseError)
      }
      
    }
  }
  
  func getEpisodes() -> Promise<[Media]> {
    return Promise { seal in
      NetworkManager.shared.request(HomeService.episodes).done {(result: APIResponse<ResponseData>) in
        guard let episodes = result.data?.media
          else { return }
        seal.fulfill(episodes)
      }.catch { error in
        print(error)
        seal.reject(NetworkError.parseError)
      }
    }
  
  }
  
  func getCategories() -> Promise<[Category]> {
    return Promise { seal in
      NetworkManager.shared.request(HomeService.categories).done {(result: APIResponse<ResponseData>) in
        guard let categories = result.data?.categories
          else { return }
        seal.fulfill(categories)
      }.catch { error in
        print(error)
        seal.reject(NetworkError.parseError)
      }
    }
  }
  
}

// generic with compilation//

// func getCategories() -> Promise<[Category]> {
//    return Promise { seal in
//      NetworkManager.shared.request(HomeService.categories).done {(result: APIResponse<ResponseData>) in
//        guard let categories = result.data?.categories
//          else { return }
//        seal.fulfill(categories)
//      }.catch { error in
//        print(error)
//        seal.reject(NetworkError.parseError)
//      }
//
//    }
//          NetworkManager.shared.genericFetch(
//            target: HomeService.categories,
//            completion: { (result: Swift.Result<APIResponse<ResponseData>, NetworkError>, _) in
//              switch result {
//                       case .success(let res):
//                        guard let categories = res.data?.categories
//                           else {
//                           return
//                         }
//                         seal.fulfill(categories)
//                       case .failure(_):
//                         seal.reject(NetworkError.parseError)
//                       }
//1          do {
//1            guard let categories = try result.get().data?.categories else { return }
//1            seal.fulfill(categories)
//1          } catch {
//1            seal.reject(NetworkError.parseError)
//1          }
// })
// }

//   to get generic one model

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
