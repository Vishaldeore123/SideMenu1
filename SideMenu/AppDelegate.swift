//
//  AppDelegate.swift
//  SideMenu
//
//  Created by Apple on 11/19/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let homeViewController = ChooseNavigationViewController()
        let mainViewController = DrawerController()
        mainViewController.rootViewController = homeViewController
        mainViewController.setup(type: 0)
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.backgroundColor = .white
        window!.rootViewController = mainViewController
        window!.makeKeyAndVisible()
        customNavigationBar()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func setRootView()  {
        var rootView: UIViewController?
        rootView = self.getHomeView()
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.backgroundColor = .white
        window!.rootViewController = rootView
        window!.makeKeyAndVisible()
    }
    
    func getHomeView() -> DrawerController? {
    let homeViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
      let mainViewController = DrawerController()
        mainViewController.rootViewController = navigationController
        mainViewController.setup(type: 0)
        return mainViewController
    }
    
    func customNavigationBar()  {
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().barTintColor = UIColor(red: 246 / 255.0, green: 246 / 255.0, blue: 246 / 255.0, alpha: 1)
        UIBarButtonItem.appearance().setTitleTextAttributes([kCTForegroundColorAttributeName as NSAttributedString.Key: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], for: .normal)
        UINavigationBar.appearance().titleTextAttributes = [kCTForegroundColorAttributeName: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)] as? [NSAttributedString.Key : Any]
        UIApplication.shared.statusBarStyle = .default  // already set in 
        
    }

}


