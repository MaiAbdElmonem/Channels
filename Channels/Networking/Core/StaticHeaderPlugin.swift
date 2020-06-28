//
//  StaticHeaderPlugin.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/16/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import Moya

public struct StaticHeaderPlugin: PluginType {
   
    var headers: [String: String] = [:]
    public init(headers: [String: String]) {
        self.headers = headers
    }
    
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request

        headers.forEach { (key, value) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
}
