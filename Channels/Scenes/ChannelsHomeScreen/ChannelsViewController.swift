//
//  ChannelsViewController.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

class ChannelsViewController: UIViewController {
  
  @IBOutlet private weak var channelsCollectionView: UICollectionView!
//  var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>?

    override func viewDidLoad() {
        super.viewDidLoad()
      channelsCollectionView.collectionViewLayout = createLayout()
      setUpCollectionView()
      configureCollectionView()
      configureHeader()
//      configureDataSource()
    }
  
  func setUpCollectionView() {
    self.title = "Channels"
    self.navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  func configureCollectionView () {
    channelsCollectionView.delegate = self
    channelsCollectionView.register(HomeCollectionViewCell.self)
    channelsCollectionView.register(BrowseCategoriesCollectionViewCell.self)
  }
  
  func configureHeader() {
    channelsCollectionView.register(
      HeaderSection.nib,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:
      HeaderSection.identifier)
  }
  
  func createLayout() -> UICollectionViewLayout {
    // collection layout
    let itemSize = NSCollectionLayoutSize(
      widthDimension: .fractionalWidth(0.5),
      heightDimension: .fractionalHeight(1.0))
    
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    // collection layout
         let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .absolute(44))
    //horizental collection 
         let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
    // section
         let section = NSCollectionLayoutSection(group: group)
         section.interGroupSpacing = 5
         section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
         let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .estimated(44))
         let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
             layoutSize: headerFooterSize,
             elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
         section.boundarySupplementaryItems = [sectionHeader]
         let layout = UICollectionViewCompositionalLayout(section: section)
         return layout
  }
  
//  func getCategoriesFromJson() -> CategoryType? {
//      if let path = Bundle.main.url(forResource: "CategorySuccess", withExtension: "json") {
//          do {
//            let data = try Data(contentsOf: path, options: .alwaysMapped)
//              let jsonResult = try JSONDecoder().decode(ApiData.self, from: data)
//            return jsonResult.data.categories
//               return  CategoryType(categories: jsonResult.data.categories ?? [Category]())
//          } catch let error {
//              print("error in parsing Categories: \(error)")
//              return  nil
//          }
//      } else {
//          print("Invalid filePath")
//          return  nil
//      }
//      
//  }
//  
//  func getChannelsFromJson() -> [Channels]? {
//      if let path = Bundle.main.url(forResource: "ChannelsSuccess", withExtension: "json") {
//          do {
//              let data = try Data(contentsOf: path, options: .alwaysMapped)
//              let jsonResult = try JSONDecoder().decode(ApiData.self, from: data)
//            return jsonResult.data.channels
//          } catch let error {
//              print("error in parsing Channels: \(error)")
//              return  nil
//          }
//      } else {
//          print("Invalid path")
//          return  nil
//      }
//      
//  }
//  
//  func getNewEpisodesFromJson() -> MediaType? {
//      if let path = Bundle.main.url(forResource: "EpisodesSuccess", withExtension: "json") {
//          do {
//              let data = try Data(contentsOf: path, options: .alwaysMapped)
//              let jsonResult = try JSONDecoder().decode(ApiData.self, from: data)
//            return MediaType(media: jsonResult.data.media ?? [Media]())
//          } catch let error {
//              print("error in parsing NewEpisodes: \(error)")
//              return  nil
//          }
//      } else {
//          print("Invalid path")
//          return  nil
//      }
//  }
//  
//  func  sectionType(section: Int) -> SectionType {
//         let sectionsArray = self.diffableDataSource?.snapshot().sectionIdentifiers
//         return sectionsArray?[section].sectionType ?? .channels
//     }
  
//  func configureDataSource() {
//    var sections = [Section]()
//    dataSource = UICollectionViewDiffableDataSource(collectionView: channelsCollectionView, cellProvider: { (collectionView, indexPath, modelItem) -> UICollectionViewCell? in
//      switch self.sections[indexPath.section] {
//
//      default:
//
//      }
//    })
//  }

}

extension ChannelsViewController: UICollectionViewDelegate {
  
}
