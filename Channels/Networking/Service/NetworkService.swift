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
            self.successResponse(response: response, resolver: resolver)
          } else {
            // 300-399 ,400-499
            self.failureResponse(response: response, resolver: resolver)
          }
          
        case .failure(let error):
          let customError = NetworkError(error: error)
          resolver.reject(customError)
        }
      }
    }
  }
  
  // using completion
  typealias NetworkCallback<T: Codable> = (_ result: Swift.Result<T, NetworkError>,
    _ statusCode: StatusCode?) -> Void
  
  func parseResponse<T: Codable>(target: TargetType, completion: @escaping NetworkCallback<T>) {
    
    provider.request(MultiTarget(target)) { (result) in
      switch result {
      case .success(let response):
        if (200...299 ~= response.statusCode) {
          self.successResponse(response: response, callback: completion)
        } else {
          // 300-399 ,400-499
          self.failureResponse(response: response, callback: completion)
        }
        
      case .failure(let error):
        let customError = NetworkError(error: error)
        completion(.failure(customError), nil)
      }
    }
    
  }
  
  func successResponse<T: Codable>(response: Moya.Response, callback: @escaping NetworkCallback<T>) {
    do {
      let result = try JSONDecoder().decode(T.self, from: response.data)
      callback(.success(result), response.statusCode)
    } catch {
      callback(.failure(NetworkError.parseError), response.statusCode)
    }
  }
  
  func failureResponse<T: Codable>(response: Moya.Response, callback: @escaping NetworkCallback<T>) {
    do {
      var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
      businessError.type = .business
      callback(.failure(businessError), response.statusCode)
    } catch {
      callback(.failure(NetworkError.parseError), response.statusCode)
    }
  }
  
  func failureResponse<T: Codable>(response: Moya.Response, resolver: Resolver<T>) {
    do {
      var businessError = try JSONDecoder().decode(NetworkError.self, from: response.data)
      businessError.type = .business
      resolver.reject(NetworkError.parseError)
    } catch {
      resolver.reject(NetworkError.parseError)
    }
  }
  
  func successResponse<T: Codable>(response: Moya.Response, resolver: Resolver<T>) {
    do {
      let result = try JSONDecoder().decode(T.self, from: response.data)
      resolver.fulfill(result)
    } catch {
      resolver.reject(NetworkError.parseError)
    }
  }
  
}
