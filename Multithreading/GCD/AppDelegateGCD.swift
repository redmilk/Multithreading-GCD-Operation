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
        
//        let serialQueue = SerialDispatchQueueExample()
//        serialQueue.execute(example: .asyncAndSyncCallsSomeWithSleepInside)
        
//        let concurrentQueue = ConcurrentDispatchQueueExample()
//        concurrentQueue.execute(example: .asyncSettingSharedValue)
        
//        let workItems = DispatchWorkItems()
//        workItems.execute(example: .all)
        
        let semaphores = DispatchSemaphoreExample()
        semaphores.execute(example: .three)
        

        fatalError()
    }
}

