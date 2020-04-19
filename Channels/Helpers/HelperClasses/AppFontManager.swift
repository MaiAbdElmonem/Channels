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
      self.font = UIFont(name: newValue, size: 30)
    }
  }
}

extension UITextField {
  var substituteFontName: String {
    get { return self.font?.fontName ?? "" }
    set { self.font = UIFont(name: newValue, size: 30) }
  }
}

extension UITextView {
  var substituteFontName: String {
    get { return self.font?.fontName ?? "" }
    set { self.font = UIFont(name: newValue, size: 30) }
  }
}
