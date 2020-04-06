//
//  SplashViewController.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 3/30/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
  @IBOutlet private weak var splashView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    animateSplash()
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      AppManager.shared.setWindowRoot(self.getInitialScene())
      AppManager.shared.window?.makeKeyAndVisible()
    }
  }
  
  func animateSplash() {
    UIView.animateKeyframes(withDuration: 1.9, delay: 0.0, options: .layoutSubviews, animations: {
      UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.5, animations: {
        //1.Expansion + button label alpha
        self.splashView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
      })
      UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
        //2.Shrink
        self.splashView.transform = self.splashView.transform.inverted()
      })
      UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
        //3.Grant momentum
        self.splashView.frame.origin.x -= 16
      })
      UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
        //4.Move out of screen and reduce alpha to 0
        self.splashView.frame.origin.x = self.view.frame.size.width
        self.splashView.alpha = 0.0
      })
    })
    
  }
  
  func getInitialScene() -> UIViewController {
    
    let launchedBefore = PersistenceManager.getBoolValue(key: .isLaunchedBefore)

    if  !launchedBefore {
      print("First launch")
      PersistenceManager.setSavedValue(value: true, key: .isLaunchedBefore)
      return Router.getHomeScene()
      
    } else {
      print("Not first launch")
      return Router.getHomeScene()
    }
  }
  
}
