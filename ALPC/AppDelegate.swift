//
//  AppDelegate.swift
//  ALPC
//
//  Created by Kevin Dion on 2018-01-16.
//  Copyright © 2018 None. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: Properties

    var window: UIWindow?

    // MARK: Delegate implementation
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let decoder = DecoderViewController()
        let green = UIViewController()
        green.view.backgroundColor = .green
        let pagedViewController = PagedViewController(viewControllers: [decoder, green])

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = pagedViewController
        window?.makeKeyAndVisible()

        return true
    }
}

