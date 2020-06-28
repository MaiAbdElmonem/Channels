//
//  NetworkManager.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/16/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import Moya
import Alamofire

typealias StatusCode = Int
//typealias NetworkResult<T: Codable> =  Swift.Result<T, NetworkError>
//typealias Completion<T: Codable> = (_ result:NetworkResult<T>, _ statusCode:StatusCode) -> Void

class NetworkManager {
    
    static var shared: NetworkManager!
    
    var networkConfig: NetworkDefaults!
    
    let provider: MoyaProvider<MultiTarget>
    
  init(config: NetworkDefaults = NetworkDefaults.defaults) {
        self.networkConfig = config
        
        let headerPlugin = StaticHeaderPlugin(
            headers: [:])
        let config = NetworkLoggerPlugin.Configuration(
            logOptions: NetworkLoggerPlugin.Configuration.LogOptions.verbose)
        provider = MoyaProvider<MultiTarget>(//manager: ,
            plugins: [headerPlugin, NetworkLoggerPlugin(configuration: config)])
    }
    
}
