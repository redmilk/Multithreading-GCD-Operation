//
//  DispatchWorkItems.swift
//  GCD-Multithreading
//
//  Created by Danyl Timofeyev on 13.02.2021.
//

import Foundation

struct DispatchWorkItems: CommandType {
    
    enum Example {
        case concurrentQueueAsyncExecution
        case concurrentQueueSyncExecution
        case serialQueueAsyncExecution
        case serialQueueSyncExecution
        case all
    }
    
    func execute(example: Example) {
        switch example {
        case .concurrentQueueAsyncExecution:
            example0()
            example0()
            example0()
        case .concurrentQueueSyncExecution:
            example1()
            example1()
            example1()
        case .serialQueueAsyncExecution:
            example2()
            example2()
            example2()
        case .serialQueueSyncExecution:
            example3()
            example3()
            example3()
        case .all:
            example0()
            example0()
            example0()
            example1()
            example1()
            example1()
            example2()
            example2()
            example2()
            example3()
            example3()
            example3()
        }
        sleep(5)
    }
    
    private func example0() {
        print("👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨 Concurrent Queue Async Execution \n")
        
        let concurrentQueue = DispatchQueue(label: "MyConcurrentQueue", attributes: .concurrent)
        
        let printWhiteSquareItem = DispatchWorkItem {
            Utils.printManiac(value: "⬜️", amount: 100)
        }
        
        let notifyPrintCircleItem = DispatchWorkItem {
            Utils.printManiac(value: "🟡", amount: 50)
        }
        printWhiteSquareItem.notify(queue: concurrentQueue, execute: notifyPrintCircleItem)
        concurrentQueue.async(execute: printWhiteSquareItem)
        
        Utils.printManiac(value: "⬛️", amount: 100)
        sleep(1)
        print("\n\n\n\n")
    }
    
    private func example1() {
        print("👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨 Concurrent Queue Sync Execution \n")
        
        let concurrentQueue = DispatchQueue(label: "MyConcurrentQueue", attributes: .concurrent)
        
        let printWhiteSquareItem = DispatchWorkItem {
            Utils.printManiac(value: "⬜️", amount: 100)
        }
        
        let notifyPrintCircleItem = DispatchWorkItem {
            Utils.printManiac(value: "🟡", amount: 50)
        }
        printWhiteSquareItem.notify(queue: concurrentQueue, execute: notifyPrintCircleItem)
        
        concurrentQueue.sync(execute: printWhiteSquareItem)
        
        Utils.printManiac(value: "⬛️", amount: 100)
        sleep(1)
        print("\n\n\n\n")
    }
    
    private func example2() {
        print("👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨 Serial Queue Async Execution \n")
        
        let concurrentQueue = DispatchQueue(label: "MyConcurrentQueue")
        
        let printWhiteSquareItem = DispatchWorkItem {
            Utils.printManiac(value: "⬜️", amount: 100)
        }
        
        let notifyPrintCircleItem = DispatchWorkItem {
            Utils.printManiac(value: "🟡", amount: 50)
        }
        printWhiteSquareItem.notify(queue: concurrentQueue, execute: notifyPrintCircleItem)
        
        concurrentQueue.async(execute: printWhiteSquareItem)
        
        Utils.printManiac(value: "⬛️", amount: 100)
        sleep(1)
        print("\n\n\n\n")
    }
    
    private func example3() {
        print("👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨 Serial Queue Sync Execution \n")
        
        let concurrentQueue = DispatchQueue(label: "MyConcurrentQueue")
        
        let printWhiteSquareItem = DispatchWorkItem {
            Utils.printManiac(value: "⬜️", amount: 100)
        }
        
        let notifyPrintCircleItem = DispatchWorkItem {
            Utils.printManiac(value: "🟡", amount: 50)
        }
        printWhiteSquareItem.notify(queue: concurrentQueue, execute: notifyPrintCircleItem)
        
        concurrentQueue.sync(execute: printWhiteSquareItem)
        
        Utils.printManiac(value: "⬛️", amount: 100)
        sleep(1)
        print("\n\n\n\n")
    }
}
