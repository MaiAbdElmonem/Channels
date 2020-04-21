//
//  HomeCollectionViewCell.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/20/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
  @IBOutlet private weak var personImage: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var subTitleLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }
  
  func configure(title: String, subTitle: String, image: UIImage) {
    personImage.image = image
    titleLabel.text = title
    subTitleLabel.text = subTitle
  }

}
