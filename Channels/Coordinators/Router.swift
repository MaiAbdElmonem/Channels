//
//  Container.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 3/24/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import UIKit

class Router {
  
  class func getSplashScene() -> UIViewController {
      return SplashViewController()
  }
  
  class func getHomeScene() -> UIViewController {
    return HomeModule.createModule()
//   return HomeViewController()
//         return ChannelViewController()
     }
}
