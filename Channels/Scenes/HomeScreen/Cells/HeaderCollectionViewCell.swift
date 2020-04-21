//
//  HeaderCollectionViewCell.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/20/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
  @IBOutlet private weak var headerImage: UIImageView!
  @IBOutlet private weak var mainTitle: UILabel!
  @IBOutlet private weak var subTitleLabel: UILabel!
  @IBOutlet private weak var subTitleView: UIView!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  func configure(title: String, image: UIImage, episodeNo: Int, showEpisodeView: Bool) {
    mainTitle.text = title
    headerImage.image = image
    subTitleLabel.text = "\(episodeNo) episodes"
    subTitleView.isHidden = showEpisodeView
  }

}
