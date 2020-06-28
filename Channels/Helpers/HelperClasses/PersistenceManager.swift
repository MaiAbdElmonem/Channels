//
//  PersistenceManager.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/4/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

 class PersistenceManager {
  private static let defaults = UserDefaults.standard
  
  static func setSavedValue<T>(value: T, key: UserDefaultKeys) {
     defaults.set(value, forKey: key.rawValue)
  }
  
  static func getBoolValue(key: UserDefaultKeys) -> Bool {
    return defaults.bool(forKey: key.rawValue)
  }
  
  static func getSavedValue<T>(type: T.Type, forKey: UserDefaultKeys) -> T? {
     let value = defaults.object(forKey: forKey.rawValue) as? T
     return value
  }
  
  static func removeData(key: UserDefaultKeys) {
     defaults.removeObject(forKey: key.rawValue)
  }
  
}
