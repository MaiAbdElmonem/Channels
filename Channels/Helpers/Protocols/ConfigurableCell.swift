//
//  ConfigurableCell.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 7/8/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
    associatedtype Model
    func configure(model: Model)
}
