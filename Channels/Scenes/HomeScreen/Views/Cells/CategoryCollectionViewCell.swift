//
//  CategoryCollectionViewCell.swift
//  IGListExample
//
//  Created by Mai Abd Elmonem on 4/27/20.
//  Copyright © 2020 Rohmts. All rights reserved.
//

import UIKit
import IGListKit

class CategoryCollectionViewCell: UICollectionViewCell {
  let categoryLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.textAlignment = .natural
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.textColor = .white
    titleLabel.lineBreakMode = .byWordWrapping
    titleLabel.numberOfLines = 0
    return titleLabel
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubView()
    setupConstraints()
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func addSubView() {
    addSubview(categoryLabel)
  }
  
  func setupConstraints() {
    contentView.backgroundColor = .darkGray
    NSLayoutConstraint.activate([
      categoryLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      categoryLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    ])
  }
  
  func setup() {
    contentView.layer.cornerRadius = self.frame.height / 2
    categoryLabel.adjustsFontForContentSizeCategory = true
  }
  
}

extension CategoryCollectionViewCell: ConfigurableCell {
  func configure(model: Category) {
    categoryLabel.text = model.name
  }  
}
