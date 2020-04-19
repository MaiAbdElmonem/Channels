//
//  AppManager.swift
//  Channels
//
//  Created by Mai Abd Elmonem on 3/24/20.
//  Copyright © 2020 Mai Abd Elmonem. All rights reserved.
//

import Foundation
import UIKit

class AppManager: NSObject {

    static let shared: AppManager = AppManager()

    private(set) var window: UIWindow?

    static func launchApp(_ application: UIApplication) {

        if #available(iOS 13, *) {
            //Scene Delegate will call  initWindow(windowScene: UIWindowScene)
        } else {
            
            initWindow()
        }
    }

    static func initWindow() {

        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc = Router.getSplashScene()
           window.rootViewController = vc
           window.makeKeyAndVisible()
           self.shared.window = window
          self.shared.setGlobalFontAppearance()
    }

    @available(iOS 13.0, *)
    static func initWindow(windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        let vc = Router.getSplashScene()
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.shared.window = window
        self.shared.setGlobalFontAppearance()
    }

    func setWindowRoot(_ viewController: UIViewController) {
        self.window?.rootViewController = viewController
    }
  
  func setGlobalFontAppearance() {
    let customFont = FontFamily.Gotu.regular.font(size: 40) ?? UIFont.systemFont(ofSize: 20)
    UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: customFont], for: .normal)
    UITextField.appearance().substituteFontName = FontFamily.Gotu.regular.family
    UILabel.appearance().substituteFontName = FontFamily.Gotu.regular.family
  }

}
