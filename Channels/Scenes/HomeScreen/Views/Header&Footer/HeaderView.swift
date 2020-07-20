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
  
  let containerView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .clear
    return view
  }()
  
  let iconImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .natural
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .white
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.font = UIFont.boldSystemFont(ofSize: 18)
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
    addSubview(containerView)
    containerView.addSubview(iconImage)
    containerView.addSubview(titleLabel)
    containerView.addSubview(subTitleLabel)
  }
  
  func setupConstraints() {
    containerView.pinConstraint(to: self, with: 0)
    NSLayoutConstraint.activate([
      iconImage.heightAnchor.constraint(equalToConstant: 55),
      iconImage.widthAnchor.constraint(equalToConstant: 55),
      iconImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
      iconImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
      titleLabel.topAnchor.constraint(equalTo: iconImage.topAnchor, constant: 5),
      titleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
      subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
      subTitleLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10)
    ])
  }
  
  func configureEpisodeHeader() {
    iconImage.widthAnchor.constraint(equalToConstant: 0).isActive = true
    titleLabel.text = "New Episodes"
    titleLabel.textColor = .lightGray
    subTitleLabel.text = nil
  }
  
  func configureCategoryHeader() {
//    let noImageWidthConstraint = iconImage.widthAnchor.constraint(equalToConstant: 0)
//    noImageWidthConstraint.priority = UILayoutPriority(rawValue: 100)
//    noImageWidthConstraint.isActive = true
    iconImage.widthAnchor.constraint(equalToConstant: 0).isActive = true
    titleLabel.text = "Browse by categories"
    titleLabel.textColor = .lightGray
    subTitleLabel.text = nil
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    iconImage.clipsToBounds = true
    iconImage.layer.cornerRadius = iconImage.frame.height / 2
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
      iconImage.widthAnchor.constraint(equalToConstant: 55).isActive = true
  }
  
}

extension HeaderView: ConfigurableCell {
  func configure(model: Channel) {
     titleLabel.text = model.title
       subTitleLabel.text = String(describing: model.mediaCount ?? 0) + " episodes"
       if let imageUrl = URL(string: model.iconAsset?.thumbnailUrl ?? "") {
         iconImage.kf.setImage(with: imageUrl)
       }
  }
  
}
