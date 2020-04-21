//
//  HeaderTitle.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

class HeaderTitle: UICollectionReusableView {

  @IBOutlet private weak var headerTitleLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
     func configureHeaderTitle(title: String) {
          headerTitleLabel.text = title
      }
  }

extension HeaderTitle {
    static var identifire: String { return String(describing: self) }
    static var nib: UINib { return UINib(nibName: self.identifire, bundle: nil) }
}
