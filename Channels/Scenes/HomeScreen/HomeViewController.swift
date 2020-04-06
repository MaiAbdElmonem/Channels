//
//  HomeViewController.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 3/24/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  // MARK: - Presenter
  // MARK: - Public Variables
  // MARK: - Private Variables
  // MARK: - IBOutlets
  @IBOutlet private weak var helloLabel: UILabel!
  // MARK: - IBActions
  // MARK: - View controller lifecycle methods
  // MARK: - Protocal
  // MARK: - Intilization
  // MARK: - staticMethods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(Environment.AppName)
//    helloLabel.font = UIFont.systemFont(ofSize: 9)

  }
  
}
