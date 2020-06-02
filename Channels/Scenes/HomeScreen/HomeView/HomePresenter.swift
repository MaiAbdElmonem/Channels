//
//  HomePresenter.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/17/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation

class HomePresenter<View: HomeViewProtocol, Model: HomeModelProtocol>:
BasePresenter<View, Model>, HomePresenterProtocol {
  
  private var view: View?
  private var model: Model?
  
  override init(view: View, model: Model) {
    super.init(view: view, model: model)
    self.view = view
    self.model = model
  }
  
  func loadData() {
    var sections: [Section] = []
    sections.append(Section(items: model?.getEpisodes() ?? []))
    sections.append(Section(items: model?.getCategories() ?? []))
//    if let channels = model?.getChannels() {
//      for channel in channels {
//        sections.append(Section(items: channel.latestMedia ?? []))
//      }
//    }
    view?.getHomeList(with: sections)
  }

}
