//
//  AppDelegate.swift
//  Multithreading
//
//  Created by Danyl Timofeyev on 12.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let gcd = GCDFeatures()
                
        return true
    }
}
