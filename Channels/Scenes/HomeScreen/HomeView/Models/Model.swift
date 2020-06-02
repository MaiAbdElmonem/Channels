//
//  Channels.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/25/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import UIKit

typealias CategoryList = [Categories]

  struct Categories {
      let name: String
      
      init(categoryName: String) {
          self.name = categoryName
      }
}
