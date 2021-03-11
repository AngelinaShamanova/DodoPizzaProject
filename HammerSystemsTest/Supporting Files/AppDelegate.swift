//
//  AppDelegate.swift
//  HammerSystemsTest
//
//  Created by Angelina on 04.02.2021.
//

import UIKit
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = TabBarController()
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        
        let attributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        return true
    }

}

