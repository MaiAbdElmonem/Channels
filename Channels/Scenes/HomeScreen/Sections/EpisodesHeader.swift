//
//  episodesHeader.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/20/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import IGListKit

class EpisodesHeader: ListDiffable {
    
    private var identifier: String = UUID().uuidString
    private(set) var episodes: String
    private(set) var title: String
    private(set) var episodeImage: UIImage
    
  init(description: String, title: String, image: UIImage) {
        self.episodes = description
        self.title = title
        self.episodeImage = image
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? EpisodesHeader else {
            return false
        }
        return self.identifier == object.identifier
    }
}
