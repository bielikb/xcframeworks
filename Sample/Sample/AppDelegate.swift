//
//  AppDelegate.swift
//  Sample
//
//  Created by Boris Bielik on 24/06/2019.
//  Copyright © 2019 BAiOS. All rights reserved.
//

import UIKit

// XCFrameworks
import DynamicFramework
// import StaticLibrary

// Development package
import SwiftPackage

// External Swift Package
import TextAttributes

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Static Library
//        let staticLib = StaticLibrary()
//        print("StaticLibrary: ", staticLib.sum(1, second: 2))

        // Dynamic Framework
        let dyn = DynamicFramework()
        print("DynamicFramework: ", dyn.sum(1, second: 2))

        // SwiftPackage
        let swiftPackage = SwiftPackage()
        print("SwiftPackage: ", swiftPackage.sum(1, second: 2))

        // Text Attributes
        _ = TextAttributes.attributes(font: UIFont.systemFont(ofSize: 17), color: UIColor.white)

        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

