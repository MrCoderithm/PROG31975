//
//  AppDelegate.swift
//  w6DictionaryDelegate
//
//  Created by Jawaad Sheikh on 2017-06-08.
//  Copyright © 2017 Jawaad Sheikh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // Step 1 - create storyboard as shown
    // Step 1b - add a new file (View Controller) for Game
    var window: UIWindow?

    // Step 2 - declare the following variables
    var title : String = ""
    var options : [String] = []
    var scores : [String : String] = [:]

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Step 3 - give variables some default values
        title = "W6 Dictionary & Delegate"
        
        //creating an array
        options = ["Play Game", "Settings", "About App"]
        
        // creating a dictionary
        scores["Score"] = "Score: 3421"
        scores["Level"] = "Level 34"
        scores["High"] = "High Score: 987332"
        scores["Time"] = "Time Left: 43"
            
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


}

