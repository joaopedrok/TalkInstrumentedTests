//
//  AppDelegate.swift
//  TalkInstrumentedTests
//
//  Created by Joao Souza on 26/04/2018.
//  Copyright © 2018 Concrete. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        IQKeyboardManager.sharedManager().toolbarDoneBarButtonItemText = "OK"
        IQKeyboardManager.sharedManager().enable = true

        window = UIWindow(frame: UIScreen.main.bounds)

        guard let window = window else {
            fatalError("Window not should be nil")
        }

        let navigationController = UINavigationController(rootViewController: LoginViewController())
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        return true
    }
}

