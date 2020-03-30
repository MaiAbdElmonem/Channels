//
//  Enviroment.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 3/25/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

public enum Environment {
  private static let infoDictionary: [String: Any] = {
    guard let dict = Bundle.main.infoDictionary else {
      fatalError("Plist file not found")
    }
    return dict
  }()

  static let AppName: String = {
    guard let appName = Environment.infoDictionary["APP_NAME"] as? String else {
      fatalError("appName Key not set in plist for this environment")
    }
    return appName
  }()
}
