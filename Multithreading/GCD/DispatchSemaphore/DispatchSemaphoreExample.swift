//
//  DispatchSemaphoreExample.swift
//  GCD-Multithreading
//
//  Created by Danyl Timofeyev on 13.02.2021.
//

import Foundation

struct DispatchSemaphoreExample: CommandType {
    
    enum Example {
        case example0
        case example1
        case example2
        case example3
        case all
    }
    
    func execute(example: Example) {
        switch example {
        case .example0: example0()
        case .example1: example1()
        case .example2: example2()
        case .example3: example3()
            
        case .all:
            example0()
            example1()
            example2()
        }
    }
    
    private func example0() {
        print("👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨 Set semaphore(value: 0) on wait from calling thread with printing [⬛️], during async performing print [⬜️] with 3 seconds delay first, and further signal to semaphore \n")
        
        /**
         Passing zero for the value is useful for when two threads need to reconcile
         * the completion of a particular event. Passing a value greater than zero is
         * useful for managing a finite pool of resources, where the pool size is equal
         * to the value.
         */
        let semaphore = DispatchSemaphore(value: 0)
        
        DispatchQueue.global().async {
            
            sleep(3)
            Utils.printManiac(value: "⬜️", amount: 100)
            semaphore.signal()
        }
        
        semaphore.wait()
        Utils.printManiac(value: "⬛️", amount: 100)
        
        sleep(5)
        print("\n\n\n\n")
    }
    
    private func example1() {
        print("👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨 Set semaphore(value: 1) will make previous example opposite, and current thread won't wait for busy resource, print order will be inverted, with 3 sec delay between \n")

        
        let semaphore = DispatchSemaphore(value: 1)
        
        DispatchQueue.global().async {
            
            sleep(3)
            Utils.printManiac(value: "⬜️", amount: 100)
            semaphore.signal()
        }
        
        semaphore.wait()
        Utils.printManiac(value: "⬛️", amount: 100)
        
        sleep(5)
        print("\n\n\n\n")
    }
    
    private let semaphore = DispatchSemaphore(value: 2)
    private func example2() {

        func doWork(symbol: String) {
            semaphore.wait()
            Utils.printManiac(value: symbol, amount: 1)

            sleep(3)
            semaphore.signal()
        }
        
        DispatchQueue.global().async {
            doWork(symbol: "⬜️")
        }
        
        DispatchQueue.global().async {
            doWork(symbol: "⬜️")
        }
        
        DispatchQueue.global().async {
            doWork(symbol: "⬛️")
        }
        
        sleep(5)
        print("\n\n\n\n")
    }
    
    private func example3() {
        print("👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨👁‍🗨 Failed attempt Semaphore like DispatchGroup behaviour, in semaphore init we provide value 3 for describing how many operation we be made concurrently \n")
        
        let semaphore3 = DispatchSemaphore(value: 3)
        
        semaphore3.wait()
        DispatchQueue.global().async {
            sleep(3)
            Utils.printManiac(value: "🟩", amount: 5)
            print("\n")
            semaphore3.signal()
        }
        
        semaphore3.wait()
        DispatchQueue.global().async {
            sleep(2)
            Utils.printManiac(value: "🟫", amount: 5)
            print("\n")
            semaphore3.signal()
        }
        
        semaphore3.wait()
        DispatchQueue.global().async {
            sleep(1)
            Utils.printManiac(value: "🟦", amount: 5)
            print("\n")
            semaphore3.signal()
        }
        
        semaphore3.wait()

        Utils.printManiac(value: "⬜️", amount: 100)
        
        sleep(4)
                        
    }
    
  
}
