//
//  HomeViewController.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 3/24/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit
import IGListKit

class HomeViewController: UIViewController {
  
  // MARK: - Presenter
  // MARK: - Public Variables
  // MARK: - Private Variables
   lazy var mainView: HomeView = {
    let homeview = HomeView()
     homeview.translatesAutoresizingMaskIntoConstraints = false
    return homeview
  }()
  
  // MARK: - IBOutlets
  // MARK: - IBActions
  
  // MARK: - Protocal
  // MARK: - Intilization
  // MARK: - Lazy Stored Properties
  
  // to control the collection view
  lazy var adapter: ListAdapter =  {
     let updater = ListAdapterUpdater()
           let adapter = ListAdapter(updater: updater, viewController: self, workingRangeSize: 0)
      adapter.collectionView = mainView.collectionView
      adapter.dataSource = HomeDataSource()
    return adapter
  }()
  // MARK: - staticMethods
  // MARK: - View controller lifecycle methods
    
  override func loadView() {
    view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(Environment.AppName)
      view.addSubview(mainView.collectionView)
    _ = adapter
//    configreCollectionView()
  }
  
  func configreCollectionView () {
//    view.addSubview(mainView.collectionView)
    adapter.collectionView = mainView.collectionView
    adapter.dataSource = HomeDataSource()
  }
  
}
