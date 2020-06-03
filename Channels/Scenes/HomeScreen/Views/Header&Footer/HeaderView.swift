//
//  HeaderView.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/4/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
  @IBOutlet weak var iconImage: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
       iconImage.layer.cornerRadius = iconImage.frame.height / 2
    }
    
}
