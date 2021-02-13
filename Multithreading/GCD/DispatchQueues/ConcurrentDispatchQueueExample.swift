//
//  ConcurrentDispatchQueueExample.swift
//  GCD-Multithreading
//
//  Created by Danyl Timofeyev on 13.02.2021.
//

import Foundation

struct ConcurrentDispatchQueueExample: CommandType {
    
    func execute() {
        print()
        Utils.printManiac(value: "🛠", amount: 50)
        print()
        print()
        print()
        
        example1()
        example2()
        example3()
        example4()
    }
    
    private func example1() {
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("Different ASYNC and SYNC calls of numbers print, some of them with sleep inside")
        print()
        
        let concurrentQueue = DispatchQueue(label: "MyConcurrentQueue", attributes: .concurrent)
        
        concurrentQueue.sync {
            Utils.printManiac(value: "0", amount: 100)
        }
        Utils.printSeparator()
        
        concurrentQueue.async {
            sleep(2)
            Utils.printManiac(value: "+1", amount: 100)
        }
        Utils.printSeparator()
        
        concurrentQueue.async {
            Utils.printManiac(value: "2", amount: 100)
        }
        Utils.printSeparator()
        
        concurrentQueue.sync {
            Utils.printManiac(value: "3", amount: 100)
        }
        Utils.printSeparator()
       
        concurrentQueue.async {
            sleep(5)
            Utils.printManiac(value: "+4", amount: 100)
        }
        Utils.printSeparator()
        
        concurrentQueue.sync {
            Utils.printManiac(value: "5", amount: 100)
        }
        Utils.printSeparator()
        
        concurrentQueue.sync {
            Utils.printManiac(value: "6", amount: 100)
        }
        Utils.printSeparator()
        
        sleep(2)
        print()
        Utils.printManiac(value: "❕", amount: 50)
        print()
        print()
        
        concurrentQueue.sync {
            Utils.printManiac(value: "0", amount: 100)
            Utils.printSeparator()
        }
        
        concurrentQueue.async {
            sleep(2)
            Utils.printManiac(value: "-1", amount: 100)
            Utils.printSeparator()
        }
        
        concurrentQueue.async {
            Utils.printManiac(value: "2", amount: 100)
            Utils.printSeparator()
        }
        
        concurrentQueue.sync {
            Utils.printManiac(value: "3", amount: 100)
            Utils.printSeparator()
        }
       
        concurrentQueue.async {
            sleep(5)
            Utils.printManiac(value: "-4", amount: 100)
            Utils.printSeparator()
        }
        
        concurrentQueue.sync {
            Utils.printManiac(value: "5", amount: 100)
            Utils.printSeparator()
        }
        
        concurrentQueue.sync {
            Utils.printManiac(value: "6", amount: 100)
            Utils.printSeparator()
        }
        sleep(10)
    }
    
    private func example2() {
        sleep(2)
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("100 executions of pair print by sync and SYNC + ASYNC")
        print()
        
        let concurrentQueue = DispatchQueue(label: "ConcurrentQueueExample", attributes: .concurrent)
        for _ in 0...1_000 {
            concurrentQueue.sync {
                Utils.printManiac(value: "⬜️", amount: 1)
            }
            concurrentQueue.async {
                Utils.printManiac(value: "⬛️", amount: 1)
            }
        }
    }
    
    private func example3() {
        sleep(2)
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("100 executions of pair print by ASYNC + ASYNC ")
        print()
        
        let concurrentQueue = DispatchQueue(label: "ConcurrentQueueExample", attributes: .concurrent)
        for _ in 0...1_000 {
            concurrentQueue.async {
                Utils.printManiac(value: "⬜️", amount: 1)
            }
            concurrentQueue.async {
                Utils.printManiac(value: "⬛️", amount: 1)
            }
        }
    }
    
    private func example4() {
        sleep(2)
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("100 executions of pair print by SYNC + SYNC")
        print()
        
        let concurrentQueue = DispatchQueue(label: "ConcurrentQueueExample", attributes: .concurrent)
        for _ in 0...1_000 {
            concurrentQueue.sync {
                Utils.printManiac(value: "⬜️", amount: 1)
            }
            concurrentQueue.sync {
                Utils.printManiac(value: "⬛️", amount: 1)
            }
        }
    }
}
