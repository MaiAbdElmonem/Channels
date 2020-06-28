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
      self.layer.cornerRadius = self.frame.height / 2
      categoryNameLabel.adjustsFontForContentSizeCategory = true
    }
  func configure(with categorey: Category) {
    categoryNameLabel.text = categorey.name
  }
  
//  func configure() {
//
//         self.backgroundColor = Asset.Colors.tunaColor.color
//         self.layer.cornerRadius = self.frame.height / 2
//         titleLabel.font = FontFamily.Gilroy.extraBold.font(size: 18)
//         categoryNameLabel.adjustsFontForContentSizeCategory = true
//         categoryNameLabel.textColor = UIColor.white
//     }
     
//     func configure(with categorey: CatListDiffable) {
//      categoryNameLabel.text = categorey.text
//     }

}
