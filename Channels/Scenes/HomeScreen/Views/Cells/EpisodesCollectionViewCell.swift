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

  let coverImage: UIImageView = {
     let image = UIImageView()
     image.translatesAutoresizingMaskIntoConstraints = false
     image.contentMode = .scaleAspectFill
     image.layer.masksToBounds = true
     image.layer.cornerRadius = 8
     return image
   }()
  
  let titleLabel: UILabel = {
     let label = UILabel()
     label.textAlignment = .natural
     label.translatesAutoresizingMaskIntoConstraints = false
     label.textColor = .white
     label.lineBreakMode = .byWordWrapping
     label.numberOfLines = 0
     return label
   }()
  
  let subTitleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .natural
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 15)
    return label
  }()
   
   override init(frame: CGRect) {
     super.init(frame: frame)
     addSubView()
     setupConstraints()
   }
   
   required init?(coder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
   }
    
  func addSubView() {
    addSubview(coverImage)
    addSubview(titleLabel)
    addSubview(subTitleLabel)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      coverImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
      coverImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
      coverImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
//      coverImage.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
      titleLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 6),
      titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 12),
      titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
      subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
      subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 12),
      subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
      subTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 3)
    ])
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
