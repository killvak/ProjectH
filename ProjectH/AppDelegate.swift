//
//  AppDelegate.swift
//  ProjectH
//
//  Created by admin on 11/25/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let activityData = ActivityData()

    var window: UIWindow?
    var mainRowCellSize : CGSize?
    var cellSize : CGSize?
    var verticalCellSize : CGSize?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        
        mainRowCellSize = CGSize(width: width  , height:  ( height * 0.47)  + 32 )
        let y = mainRowCellSize?.height
        let x = mainRowCellSize?.width
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone {
            cellSize = CGSize(width: x! * 0.40 , height:  y! * 0.85)
            verticalCellSize = CGSize(width: x! * 0.43 , height:  (x! * 0.47) * 1.5 )
        }else {
            cellSize = CGSize(width: x! * 0.35 , height:  y! * 0.85)
            verticalCellSize = CGSize(width: x! * 0.35 , height:  y! * 0.85)
        }
        
        IQKeyboardManager.sharedManager().enable = true
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

    func isLoading() {
        
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    func killLoading() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
}

let ad = UIApplication.shared.delegate as! AppDelegate
