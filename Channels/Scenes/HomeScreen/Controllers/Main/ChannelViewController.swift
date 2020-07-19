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
  
  // MARK: - Presenter
  private var presenter: HomePresenterProtocol?
  func setPresenter(presenter: HomePresenterProtocol) {
    self.presenter = presenter
  }
  // MARK: - load view
  private lazy var mainView: HomeView = {
    return HomeView()
  }()
  
  var homeAdaptor = HomeAdapter()
  lazy var adapter: ListAdapter = {
    return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
  }()
  override func loadView() {
      view = mainView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.loadData()
//    homeAdaptor = HomeDataSource(view: self, collectionView: channelCollectionView)
    setupView()
  }
    
  override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
//         adapter.performUpdates(animated: true, completion: nil)
     }
  
  private func setupView() {
    adapter.collectionView = mainView.collectionView
    adapter.dataSource = homeAdaptor
    //view of this controller
    view.addSubview(mainView.collectionView)
  }
  
}

extension ChannelViewController: HomeViewProtocol {
  func getHomeList(with data: [Section]) {
    homeAdaptor.add(items: data)
    adapter.performUpdates(animated: true, completion: nil)
  } 
}
