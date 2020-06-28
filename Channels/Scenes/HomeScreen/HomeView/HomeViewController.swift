//
//  HomeViewController.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 3/24/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit
import IGListKit
import Moya
import Alamofire

class HomeViewController: UIViewController {
//BaseViewController, HomeViewProtocol {
  
  // MARK: - Presenter
  private var presenter: HomePresenterProtocol?
  func setPresenter(presenter: HomePresenterProtocol) {
      self.presenter = presenter
  }
  
  // MARK: - Public Variables
  // MARK: - Private Variables
//   lazy var mainView: HomeView = {
//    let homeview = HomeView()
//     homeview.translatesAutoresizingMaskIntoConstraints = false
//    return homeview
//  }()
  
  // MARK: - IBOutlets
  // MARK: - IBActions
  
  // MARK: - Protocal
  // MARK: - Intilization
  // MARK: - Lazy Stored Properties
  
  // to control the collection view
//  lazy var adapter: ListAdapter =  {
//     let updater = ListAdapterUpdater()
//           let adapter = ListAdapter(updater: updater, viewController: self)
//      adapter.collectionView = mainView.collectionView
//      adapter.dataSource = HomeDataSource()
//    return adapter
//  }()
  // MARK: - staticMethods
  // MARK: - View controller lifecycle methods
    
//  override func loadView() {
//    view = mainView
//  }
 
  let model = HomeModel()
  override func viewDidLoad() {
    super.viewDidLoad()
    print(Environment.AppName)
//    get()
//    AF.request("https://pastebin.com/raw/A0CgArX3").response { resonse in
//      debugPrint(resonse)
//    }
//    let sss = model.getChannels()
//    print(sss)

//      view.addSubview(mainView.collectionView)
//    _ = adapter
//    configreCollectionView()
  }
  
//  func get() {
//    model.get(target: HomeService.categories) { (result) in
//      switch result {
//        
//      case .success(let response):
//        print(response.categories as Any)
//      case .failure(let err):
//        print(NetworkError.parseError)
//      }
//    ddd.genericFetch(target: HomeService.categories) { (result: Result<APIResponse<ResponseData>, NetworkError>, _) in
//      switch result {
//
//      case .success(let response):
//        print("names\(response.data?.categories)")
//      case .failure:
//        print(NetworkError.parseError)
//      }
 
//  func configreCollectionView () {
//    view.addSubview(mainView.collectionView)
//    adapter.collectionView = mainView.collectionView
//    adapter.dataSource = HomeDataSource()
//  }
  
}
