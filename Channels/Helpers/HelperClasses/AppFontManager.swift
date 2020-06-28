//
//  AppFontManager.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/5/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import UIKit

enum FontName: String {
  case avenir = "Avenir"
}

extension UILabel {
  var substituteFontName: UIFont {
    get { return self.font }
    set {
      //get old size of lable font
      //          let sizeOfOldFont = self.font.pointSize
      //get new name  of font
      let fontNameOfNewFont = newValue.fontName
      self.font = UIFont(name: fontNameOfNewFont, size: newValue.pointSize)
    }
  }
}

extension UITextField {
  var substituteFontName: UIFont {
    get { return self.font ?? UIFont.systemFont(ofSize: 20.0) }
    set { self.font = UIFont(name: newValue.fontName, size: (newValue.pointSize)) }
  }
}
