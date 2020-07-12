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
    setup()
  }
  
  func setup() {
    coverImage.contentMode = .scaleAspectFill
    coverImage.layer.masksToBounds = true
    coverImage.layer.cornerRadius = 15
  }
  
}

extension EpisodesCollectionViewCell: ConfigurableCell {
  func configure(model: Media) {
    titleLabel.text = model.title
    subTitleLabel.text = model.channel?.title
    if let imageUrl = URL(string: model.coverAsset?.url ?? "") {
      coverImage.kf.setImage(with: imageUrl)
    }
  }
  
}
