//
//  UIView+Extensions.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 4/20/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

typealias SuperView = UIView
typealias Padding = CGFloat

extension UIView {
    func pinConstraint(to superView: SuperView, with padding: Padding) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor, constant: padding),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -padding),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: padding),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -padding)
           
            ])
    }
}
