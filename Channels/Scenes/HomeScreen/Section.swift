//
//  Section.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/28/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import IGListKit

class Section: ListDiffable {
   private var identifier: String = UUID().uuidString
  func diffIdentifier() -> NSObjectProtocol {
    return identifier as NSString
  }
  
  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    return true
  }
  
//  var name: String?
  var items: [Any]?
  init(items: [Any]) {
//    self.name = name
    self.items = items
  }
}

//protocol MyProtocol {
//    var value: Self { get }
//}

class MyStruct<T: Any>: ListDiffable {
  private var identifier: String = UUID().uuidString
  func diffIdentifier() -> NSObjectProtocol {
    return identifier as NSString
  }
  
  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    return true
  }
  
  var property: [T]
  init(property: [T]) {
    self.property = property
  }
}
//typealias SectionType = MyStruct<[Any]>
//enum Thing {
//    case int(Int)
//    case string(String)
//    case intStruct(MyStruct)
//}
//let myIntStruct = Thing.intStruct(MyStruct(property: [Any]))
