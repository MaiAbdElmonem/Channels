//
//  ChannelViewController.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/25/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit
import IGListKit

class ChannelViewController: BaseViewController {
  
  @IBOutlet private weak var channelCollectionView: UICollectionView!
  // MARK: - Presenter
  private var presenter: HomePresenterProtocol?
  func setPresenter(presenter: HomePresenterProtocol) {
    self.presenter = presenter
  }
  var homeAdaptor = HomeAdapter()
  lazy var adapter: ListAdapter = {
    return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.loadData()
//    homeAdaptor = HomeDataSource(view: self, collectionView: channelCollectionView)
    setupView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         adapter.performUpdates(animated: true, completion: nil)
     }
  
  private func setupView() {
    adapter.collectionView = channelCollectionView
    adapter.dataSource = homeAdaptor
  }
  
}

extension ChannelViewController: HomeViewProtocol {
  func getHomeLists(with data: [AnyObject]) {
    homeAdaptor.adds(items: data)
  }
  
//  func getHomeList(with data: [Section]) {
//    homeAdaptor.add(items: data)
//  } 
}
