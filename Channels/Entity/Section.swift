//
//  Entity.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

enum SectionType: String, Codable {
    case newEpisodes
    case channels
    case categories
}

struct Section: Hashable {
    let sectionObject: AnyHashable
    let sectionType: SectionType
    let identifier = UUID()
    func hash(into hasher: inout Hasher) {
                 return hasher.combine(identifier)
             }
    static func == (lhs: Section, rhs: Section) -> Bool {
                 return lhs.identifier == rhs.identifier
       }
}
