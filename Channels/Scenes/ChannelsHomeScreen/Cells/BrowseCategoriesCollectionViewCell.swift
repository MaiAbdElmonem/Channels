//
//  BrowseCategoriesCollectionViewCell.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/20/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

class BrowseCategoriesCollectionViewCell: UICollectionViewCell {
  @IBOutlet private weak var categoryView: UIView!
  @IBOutlet private weak var categoryLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
      categoryView.layer.cornerRadius = self.frame.size.height / 2
      categoryView.layer.masksToBounds = true
    }
  
  func configure(category: String) {
    categoryLabel.text = category
  }

}
