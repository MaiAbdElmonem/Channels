//
//  BaseView.swift
//  Channels
//
//  Created Mai Abd Elmonem on 3/24/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

protocol BaseViewProtocol {
    
    func showLoading(allowNavigation: Bool)

    func hideLoading()

    func showError(message: String)
}
