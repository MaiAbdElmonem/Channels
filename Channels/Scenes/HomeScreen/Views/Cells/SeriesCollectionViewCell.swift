//
//  SeriesCollectionViewCell.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/4/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

class SeriesCollectionViewCell: UICollectionViewCell {
  @IBOutlet private weak var seriesImage: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subTitleLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        seriesImage.contentMode = .scaleAspectFill
        seriesImage.layer.masksToBounds = true
        seriesImage.layer.cornerRadius = 15
        seriesImage.alpha = 0.4
    }
  
  func configure(with media: Media) {
  titleLabel.text = media.title
  subTitleLabel.text = media.channel?.title
    if let imageUrl = URL(string: media.coverAsset?.url ?? "") {
      seriesImage.kf.setImage(with: imageUrl)
    }
  }
}
