//
//  AppFontManager.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/5/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
  var substituteFontName: String {
    get { return self.font.fontName }
    set {
      //get new name  of font
      self.font = UIFont(name: newValue, size: 16)
    }
  }
}

extension UITextField {
  var substituteFontName: String {
    get { return self.font?.fontName ?? "" }
    set { self.font = UIFont(name: newValue, size: 16) }
  }
}

extension UITextView {
  var substituteFontName: String {
    get { return self.font?.fontName ?? "" }
    set { self.font = UIFont(name: newValue, size: 16) }
  }
}

class AppFont {
  
static func setGlobalFontAppearance() {
   let customFont = FontFamily.Gotu.regular.font(size: 40) ?? UIFont.systemFont(ofSize: 20)
   UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: customFont], for: .normal)
   UITextField.appearance().substituteFontName = FontFamily.Gotu.regular.family
   UILabel.appearance().substituteFontName = FontFamily.Gotu.regular.family
 }
}
