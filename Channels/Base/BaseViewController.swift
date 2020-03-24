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
