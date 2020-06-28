//
//  HomeView.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/20/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

class HomeView: UIView {

  let collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .vertical
      layout.minimumLineSpacing = 0
      layout.minimumInteritemSpacing = 0
    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
      collection.isScrollEnabled = true
      return collection
  }()
  
  override init(frame: CGRect) {
      super.init(frame: frame)
      setupLayoutUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  func setupLayoutUI() {
      addSubView()
      setBackground()
      setupConstraints()
  }
  
  func setBackground() {
    collectionView.backgroundColor = .red
  }
  
  func addSubView() {
      addSubview(collectionView)
  }
  
  func setupConstraints() {
    collectionView.pinConstraint(to: self, with: 0)
  }

}
