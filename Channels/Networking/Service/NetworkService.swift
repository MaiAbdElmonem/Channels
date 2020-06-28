//
//  NetworkService.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/16/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import Moya

extension NetworkManager {
  func getNewsSlider(completion: @escaping (
      _ result: Swift.Result<APIResponse<ResponseData>, NetworkError>,
      _ statusCode: StatusCode?
      ) -> Void) {
      
      provider.request(MultiTarget(HomeService.categories)) { (result) in
          switch result {
          case .success(let response):
              if (200...299 ~= response.statusCode) {
                  do {
                    let result = try JSONDecoder().decode(APIResponse<ResponseData>.self, from: response.data)
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
  
  func gett<T: Codable>(target: TargetType, decodingType: APIResponse<T>.Type, completion: @escaping (
  _ result: Swift.Result<T, NetworkError>,
  _ statusCode: StatusCode?
  ) -> Void) {
    provider.request(MultiTarget(target)) { (result) in
          switch result {
          case .success(let response):
            if (200...299 ~= response.statusCode) {
              do {
                let result = try JSONDecoder().decode(decodingType, from: response.data)
                if result.isSuccess ?? false, let data = result.data {
                  completion(Result.success(data), response.statusCode)
                }
    //            completion(.success(result), response.statusCode)
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
  
  func genericFetch<T: Codable>(target: TargetType, completion: @escaping (
    _ result: Result<T, NetworkError>,
    _ statusCode: StatusCode?
    ) -> Void) {
    
    provider.request(MultiTarget(target)) { (result) in
      switch result {
      case .success(let response):
        if (200...299 ~= response.statusCode) {
          do {
            let result = try JSONDecoder().decode(T.self, from: response.data)
            completion(.success(result), response.statusCode)
//            if let data = result.data {
//              completion(Result.success(data), response.statusCode)
//            }
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
