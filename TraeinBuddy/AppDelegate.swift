//
//  AppDelegate.swift
//  TraeinBuddy
//
//  Created by José Miguel Figueiredo on 30/03/2018.
//  Copyright © 2018 Jose Figueiredo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let navController = MainNavigationController(rootViewController: StationListWireframe.createStationListModule())
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }

}

