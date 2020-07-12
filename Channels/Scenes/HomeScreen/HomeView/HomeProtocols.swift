//
//  HomeProtocols.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/17/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import PromiseKit

protocol HomePresenterProtocol: BasePresenterProtocol {
  func loadData()
}

protocol HomeViewProtocol: BaseViewProtocol {
    func getHomeList(with data: [Section])
}

protocol HomeModelProtocol: BaseModelProtocol {
    func getChannels() -> Promise<[Channel]>
    func getEpisodes() -> Promise<[Media]>
    func getCategories() -> Promise<[Category]>
}
