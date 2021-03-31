//
//  AppDelegate.swift
//  appDemo
//
//  Created by StephenFang on 2021/3/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        let nvc = UINavigationController.init(rootViewController: HomeViewController());
        self.window?.rootViewController = nvc;
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

