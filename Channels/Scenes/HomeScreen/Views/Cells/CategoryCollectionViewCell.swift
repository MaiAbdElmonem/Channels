//
//  CategoryCollectionViewCell.swift
//  IGListExample
//
//  Created by Mai Abd Elmonem on 4/27/20.
//  Copyright © 2020 Rohmts. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
  @IBOutlet private weak var categoryNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  func setup() {
    self.layer.cornerRadius = self.frame.height / 2
    categoryNameLabel.adjustsFontForContentSizeCategory = true
  }
  
}

extension CategoryCollectionViewCell: ConfigurableCell {
  func configure(model: Category) {
    categoryNameLabel.text = model.name
  }  
}
