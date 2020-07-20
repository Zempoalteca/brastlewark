//
//  AppDelegate.swift
//  Brastlewark
//
//  Created by Gabriel Z on 18/07/20.
//  Copyright © 2020 Zempoalteca. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        return true
    }

    // MARK: - Functions
    func goToDashboard() {
        let dashboard = DashboardViewController()
        let navController = UINavigationController(rootViewController: dashboard)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }

}
