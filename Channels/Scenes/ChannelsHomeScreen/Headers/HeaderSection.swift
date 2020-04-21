//
//  HeaderSection.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

class HeaderSection: UICollectionReusableView {
  @IBOutlet private weak var headerImage: UIImageView!
  @IBOutlet private weak var subTitleLabel: UILabel!
  @IBOutlet private weak var titleLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
   func configureHeader(title: String, episodeNo: Int, image: UIImage ) {
          headerImage.image = image
          titleLabel.text = title
          subTitleLabel.text = "\(episodeNo) episodes "
      }
}
    
extension HeaderSection {
     static var identifier: String { return String(describing: self) }
     static var nib: UINib { return UINib(nibName: self.identifier, bundle: nil) }
 }
