//
//  NetworkService.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/16/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import Moya
import PromiseKit

extension NetworkManager {
  // using promise
  func request<T: Codable>(_ target: TargetType) -> Promise<T> {
    return Promise<T> { (resolver) in
      provider.request(MultiTarget(target)) { (result) in
        switch result {
        case .success(let response):
          if (200...299 ~= response.statusCode) {
            do {
              let result = try JSONDecoder().decode(T.self, from: response.data)
              resolver.fulfill(result)
            } catch {
              resolver.reject(NetworkError.parseError)
            }
          } else {
            // 300-399 ,400-499
            do {
              var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
              businessError.type = .business
              resolver.reject(NetworkError.parseError)
            } catch {
              resolver.reject(NetworkError.parseError)
            }
          }
          
        case .failure(let error):
          let customError = NetworkError(error: error)
          resolver.reject(customError)
        }
      }
    }
  }
  
  // using completion
  func genericFetch<T: Codable>(target: TargetType, completion: @escaping (
    _ result: Swift.Result<T, NetworkError>,
    _ statusCode: StatusCode?
    ) -> Void) {
    
    provider.request(MultiTarget(target)) { (result) in
      switch result {
      case .success(let response):
        if (200...299 ~= response.statusCode) {
          do {
            let result = try JSONDecoder().decode(T.self, from: response.data)
            completion(.success(result), response.statusCode)

          } catch {
            completion(.failure(NetworkError.parseError), response.statusCode)
          }
        } else {
          // 300-399 ,400-499
          do {
            var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
            businessError.type = .business
            completion(.failure(businessError), response.statusCode)
          } catch {
            completion(.failure(NetworkError.parseError), response.statusCode)
          }
        }
        
      case .failure(let error):
        let customError = NetworkError(error: error)
        completion(.failure(customError), nil)
      }
    }
    
  }
}
