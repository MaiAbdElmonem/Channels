//
//  HomePresenter.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/17/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import PromiseKit

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
//    var models: [AnyObject] = []
    var sections: [Section] = []
    guard let episodesPromise = model?.getEpisodes()
      else { return }
    guard let channelsPromise = model?.getChannels() else { return }
    guard let categoriesPromise = model?.getCategories() else { return }
    
    firstly {
      when(fulfilled: episodesPromise, channelsPromise, categoriesPromise)
    }.done { episodes, channels, categories in
      // display ui according to this order
      sections.append(Section(headers: episodes, items: episodes))
      for channel in channels {
        sections.append(Section(headers: channels, items: channel.latestMedia ?? []))
      }
      sections.append(Section(headers: categories, items: categories))
       self.view?.getHomeList(with: sections)
    }.catch { error in
      print(error)
    }
  }

}
