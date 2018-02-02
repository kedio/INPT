//
//  AppDelegate.swift
//  INPT
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
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = createRootViewController()
        window?.makeKeyAndVisible()

        return true
    }

    private func createRootViewController() -> UIViewController {
        let serializer = SignificantBitClearingSerializer()
        let encoder = EncoderViewController(serializer: serializer)
        let decoder = DecoderViewController(serializer: serializer)

        return PagedViewController(viewControllers: [encoder, decoder])
    }
}

