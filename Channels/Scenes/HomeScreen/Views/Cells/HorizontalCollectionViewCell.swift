//
//  HorizontalCollectionViewCell.swift
//  IGListExample
//
//  Created by Mai Abd Elmonem on 4/28/20.
//  Copyright © 2020 Rohmts. All rights reserved.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    lazy var horizontalCollectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .horizontal
           let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
      view.backgroundColor = .blue
           view.backgroundColor = .clear
           view.showsHorizontalScrollIndicator = false
           view.alwaysBounceVertical = false
           view.alwaysBounceHorizontal = true
           self.contentView.addSubview(view)
           return view
       }()
       
       override func layoutSubviews() {
           super.layoutSubviews()
           horizontalCollectionView.frame = contentView.frame
       }
}
