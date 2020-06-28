//
//  CollectionView+Extensions.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/21/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register<Cell: UICollectionViewCell>(_ cellType: Cell.Type) {
        register(Cell.self, forCellWithReuseIdentifier: String(describing: Cell.self))
    }
    
    func dequeueCell<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell? {
      return self.dequeueReusableCell(withReuseIdentifier: String(describing: Cell.self), for: indexPath) as? Cell
    }
}
