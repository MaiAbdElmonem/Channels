//
//  BaseViewController.swift
//  Channels
//
//  Created Mai Abd Elmonem on 3/24/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, BaseViewProtocol {
  var viewDidLoadCompletion: ((UIViewController) -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                            style: UIBarButtonItem.Style.plain,
                                                            target: nil,
                                                            action: nil)
    self.viewDidLoadCompletion?(self)
  }
  func showLoading(allowNavigation: Bool) {
    fatalError("\(#function) Not Implemented")
  }
  
  func hideLoading() {
    fatalError("\(#function) Not Implemented")
  }
  
  func showError(message: String) {
    fatalError("\(#function) Not Implemented")
  }
}
