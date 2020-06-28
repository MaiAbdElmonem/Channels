//
//  BaseAdapterProtocal.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/27/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

protocol BaseListAdapterProtocal: class {
    associatedtype DataType

    var list: [DataType]? { get set }
        
//    var reloadData:(() -> Void)? { get set }

//    var showEmptyState: ((Bool) -> Void)? { get set }
    
    func add(item: DataType)
    func add(items: [DataType])
    func update(item: DataType)
    func count() -> Int
    func isLastIndex(index: IndexPath) -> Bool
//    func clear(reload: Bool)
}
