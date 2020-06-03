//
//  HomeSectionController.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/26/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import IGListKit

//class HomeSectionController: ListSectionController {
//
//    private var object: HomeSection?
//
//    lazy var adapter: ListAdapter = {
//        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self.viewController)
//        adapter.dataSource = self
//        return adapter
//    }()
//
//    var items: [Any] = []
//    var vmModel: HomeConstants?
//
//    init(vmModel: HomeConstants) {
//        self.vmModel = vmModel
//    }
//
//    override func sizeForItem(at index: Int) -> CGSize {
//        let width = collectionContext?.containerSize.width
//        switch object {
//        case .requirements:
//          let height = (collectionContext?.containerSize.width ?? 0 / 4) + 86.5 // 190
//          return CGSize(width: width ?? 0, height: height)
//        case .news:
//          let height = (collectionContext?.containerSize.width ?? 0 / 1.5) - 6 // 270
//          return CGSize(width: width ?? 0, height: height - 50)
//        default:
//          return CGSize(width: width ?? 0, height: 60)
//        }
//    }
//
//    override func cellForItem(at index: Int) -> UICollectionViewCell {
//        switch object {
//        case .requirements:
//            guard let cell = collectionContext?.dequeueReusableCell(withNibName: "EpisodesCollectionViewCell",
//                                                                    bundle: nil,
//                                                                    for: self,
//                                                                    at: index) as? EpisodesCollectionViewCell else {
//                                                                        fatalError("episode")
//            }
  //           adapter.collectionView = cell.collectionView
  //          cell.titleLabel.text = "Requirements"
//            return cell
//        case .news:
//            guard let cell = collectionContext?.dequeueReusableCell(withNibName: "HomeNewsCell",
//                                                                    bundle: nil,
//                                                                    for: self,
//                                                                    at: index) as? HomeNewsCell else {
//                                                                        fatalError()
//            }
//            adapter.collectionView = cell.collectionView
//            return cell
//        default:
//            return UICollectionViewCell()
//        }
//    }
//
//    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
//        switch object {
//        case .requirements:
//            guard let number = vmModel?.dataRequirementsCount() else { return [] }
//            return (0..<number).map { $0 as ListDiffable }
//        case .news:
//            guard let number = vmModel?.dataNewsCount() else { return [] }
//            return (0..<number).map { $0 as ListDiffable }
//        default:
//            return []
//        }
//    }
//
//    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
//        switch self.object {
//        case .requirements:
//            let vc = SectionHeader()
//            vc.data = self.vmModel?.dataRequirements
//            return vc
//        case .news:
//            let vc = ChannelSection()
//            vc.data = self.vmModel?.dataNews
//            return vc
//        default:
//            let vc = ChannelSection()
//            vc.data = self.vmModel?.dataNews
//            return vc
//        }
//    }
//
//    func emptyView(for listAdapter: ListAdapter) -> UIView? {
//        return nil
//    }
//
//    override func didUpdate(to object: Any) {
//      self.object = HomeSection(rawValue: object as? String ?? "")
//    }
//}
