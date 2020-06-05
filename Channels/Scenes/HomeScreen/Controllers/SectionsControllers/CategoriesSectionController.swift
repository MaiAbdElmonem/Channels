//
//  EmbedCategories.swift
//  IGListExample
//
//  Created by Mai Abd Elmonem on 4/27/20.
//  Copyright © 2020 Rohmts. All rights reserved.
//

import Foundation
import IGListKit

 class CategoriesSectionController: ListSectionController {
  var categoryList: [Category] = []
  var model: MyStruct<Category>?
//  var model: Section?
     override init() {
         super.init()
         self.inset = .init(top: 10, left: 10, bottom: 10, right: 10)
      self.minimumLineSpacing = 10
      self.minimumInteritemSpacing = 5
      supplementaryViewSource = self
     }
    
      override func numberOfItems() -> Int {
        return categoryList.count
//        if let sss = model?.items as? [Category] {
//          return sss.count
//        } else {
//          return 0
//        }
      }
  
  override func cellForItem(at index: Int) -> UICollectionViewCell {
    guard let cell = collectionContext?.dequeueReusableCell(withNibName: "CategoryCollectionViewCell", bundle: nil,
                                                            for: self,
                                                            at: index) as? CategoryCollectionViewCell else {
                                                                        fatalError("categories cell failed")
            }
//    guard let categories = model?.items?[index] as? Category else { return UICollectionViewCell() }

    cell.configure(with: categoryList[index])
           return cell
  }
  
  override func sizeForItem(at index: Int) -> CGSize {
    let width = collectionContext?.containerSize.width ?? 0
    let widthItem = ((width - 50) / 2) - 8
            return CGSize(width: widthItem, height: widthItem / 2)
    }
  
  override func didUpdate(to object: Any) {
//    model = object as? Section
    if let container = (object as? MyStruct<Category>) {
//      container.property.append(contentsOf: categoryList)
      self.categoryList = container.property
    } else {
        self.categoryList = []
    }
  }
  
}
extension CategoriesSectionController: ListSupplementaryViewSource {
  func supportedElementKinds() -> [String] {
    return [UICollectionView.elementKindSectionHeader]
  }
  
  func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        return userHeaderView(atIndex: index)
  }
  
  func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
    let width = collectionContext?.containerSize.width ?? 0
    return CGSize(width: width, height: 80)
  }
  
  private func userHeaderView(atIndex index: Int) -> UICollectionReusableView {
         guard let view = collectionContext?.dequeueReusableSupplementaryView(
          ofKind: UICollectionView.elementKindSectionHeader,
          for: self, nibName: "HeaderView", bundle: nil,
          at: index) as? HeaderView else {
            fatalError("no categories section header")
         }
    view.titleLabel.text = "sdwqdq"
    view.subtitleLabel.text = "90 episodes"
         
         return view
     }
  
}
