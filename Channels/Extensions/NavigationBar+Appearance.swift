//
//  NavigationBar+Appearance.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 3/24/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationItem {
  func clearBackBarButtonTitle() {
    let backBarButton: UIBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    self.backBarButtonItem = backBarButton
    backBarButton.tintColor = .black
  }
}
