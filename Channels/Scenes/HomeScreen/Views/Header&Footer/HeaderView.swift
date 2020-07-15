//
//  HeaderView.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/4/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit
import Kingfisher

class HeaderView: UICollectionReusableView {
  @IBOutlet private weak var iconImage: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subtitleLabel: UILabel!
  @IBOutlet private weak var iconWidth: NSLayoutConstraint!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    iconImage.layer.cornerRadius = iconImage.frame.height / 2
    titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
    subtitleLabel.font = UIFont.systemFont(ofSize: 15)
  }
  
  func configureEpisodeHeader() {
    iconWidth.constant = 0
    titleLabel.text = "New Episodes"
    titleLabel.textColor = .lightGray
    subtitleLabel.text = nil
  }
  
  func configureCategoryHeader() {
    iconWidth.constant = 0
    titleLabel.text = "Browse by categories"
    titleLabel.textColor = .lightGray
    subtitleLabel.text = nil
  }
  
}

extension HeaderView: ConfigurableCell {
  func configure(model: Channel) {
     titleLabel.text = model.title
       subtitleLabel.text = String(describing: model.mediaCount ?? 0) + " episodes"
       if let imageUrl = URL(string: model.iconAsset?.thumbnailUrl ?? "") {
         iconImage.kf.setImage(with: imageUrl)
       }
  }
  
}
