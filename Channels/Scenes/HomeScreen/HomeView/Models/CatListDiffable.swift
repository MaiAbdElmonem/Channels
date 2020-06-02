//
//  catListDiffable.swift
//  IGListExample
//
//  Created by Mai Abd Elmonem on 4/27/20.
//  Copyright © 2020 Rohmts. All rights reserved.
//

import Foundation
import IGListKit

class CatListDiffable: ListDiffable {
    let text: String
 private var identifier: String = UUID().uuidString
    init(text: String) {
        self.text = text
    }

    func diffIdentifier() -> NSObjectProtocol {
         return identifier as NSString
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CatListDiffable else {
            return false
        }
        return self.identifier == object.identifier
    }}

class EpisodesListDiffable: ListDiffable {
   let text: String
   let images: UIImage
  
private var identifier: String = UUID().uuidString
  
  init(text: String, images: UIImage) {
       self.text = text
       self.images = images
   }

   func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
   }

   func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
       guard let object = object as? EpisodesListDiffable else {
           return false
       }
       return self.identifier == object.identifier
   }}
