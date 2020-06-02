//
//  HomeWireFrame.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 5/27/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import  UIKit

class HomeModule {

    class func createModule() -> UIViewController {

        let view = ChannelViewController(nibName: "ChannelViewController", bundle: nil)
        let model = HomeModel()
        let presenter = HomePresenter(view: view, model: model)
        view.setPresenter(presenter: presenter)

        return view

    }
}
