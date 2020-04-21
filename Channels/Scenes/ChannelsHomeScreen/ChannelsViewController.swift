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
  var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>?
//   var dataSource: UICollectionViewDiffableDataSource<Section, Film>

    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
  func setUpCollectionView() {
    self.title = "Channels"
    self.navigationController?.navigationBar.prefersLargeTitles = true
    channelsCollectionView.collectionViewLayout = createLayout()
    configureCollectionView()
    configureHeader()
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
             elementKind:  UICollectionView.elementKindSectionHeader, alignment: .top)
         section.boundarySupplementaryItems = [sectionHeader]
         let layout = UICollectionViewCompositionalLayout(section: section)
         return layout
  }

}

extension ChannelsViewController: UICollectionViewDelegate {
  
}
