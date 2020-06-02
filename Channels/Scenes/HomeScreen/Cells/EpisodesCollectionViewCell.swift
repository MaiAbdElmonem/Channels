//
//  EpisodesCollectionViewCell.swift
//  IGListExample
//
//  Created by Mai Abd Elmonem on 4/28/20.
//  Copyright © 2020 Rohmts. All rights reserved.
//

import UIKit
import Kingfisher

class EpisodesCollectionViewCell: UICollectionViewCell {
  @IBOutlet private weak var coverImage: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subTitleLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      coverImage.contentMode = .scaleAspectFill
      coverImage.layer.masksToBounds = true
      coverImage.layer.cornerRadius = 15
//      coverImage.alpha = 0.4
    }
  
  func configure(with media: Media) {
    titleLabel.text = media.title
    subTitleLabel.text = media.channel?.title
    if let imageUrl = URL(string: media.coverAsset?.url ?? "") {
      coverImage.kf.setImage(with: imageUrl)
    }
  }

}
