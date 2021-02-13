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
        
        let serialQueue = SerialDispatchQueueExample()
        serialQueue.execute()
        
        sleep(10)
        
        let concurrentQueue = ConcurrentDispatchQueueExample()
        concurrentQueue.execute()
                
        fatalError("Set a breakpoint before this call")
        return true
    }
}

