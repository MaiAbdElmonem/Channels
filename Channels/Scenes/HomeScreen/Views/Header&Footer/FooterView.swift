//
//  FooterView.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/4/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

class FooterView: UICollectionReusableView {
  let lineView: UIView = {
    let view = UIView()
    view.backgroundColor = .darkGray
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
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
    addSubview(lineView)
  }
  
  func setupConstraints() {
    NSLayoutConstraint.activate([
      lineView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      lineView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      lineView.heightAnchor.constraint(equalToConstant: 1),
      lineView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15)
    ])
  }
  
}
