//
//  Category.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

struct CategoryType: Hashable {
    let sectionType: SectionType = .categories
    let title = "Browse by Categories"
    let categories: [Category]
    let identifier = UUID()
          
    func hash(into hasher: inout Hasher) {
                 return hasher.combine(identifier)
             }
             
    static func == (lhs: CategoryType, rhs: CategoryType) -> Bool {
                 return lhs.identifier == rhs.identifier
       }
}

struct Category: Hashable, Codable {
    let name: String
    let identifier = UUID()

    func hash(into hasher: inout Hasher) {
                 return hasher.combine(identifier)
             }

    static func == (lhs: Category, rhs: Category) -> Bool {
                 return lhs.identifier == rhs.identifier
       }
}
