//
//  ConcurrentDispatchQueueExample.swift
//  GCD-Multithreading
//
//  Created by Danyl Timofeyev on 13.02.2021.
//

import Foundation

class ConcurrentDispatchQueueExample: CommandType {
    
    enum Example {
        case asyncAndSyncCallsSomeWithAfterDeadline
        case asyncAndSyncCallsSomeWithSleepInside
        case syncAndAsyncPairPrints
        case asyncAndAsyncPairPrints
        case syncAndSyncPairPrints
        case asyncAndOutsidePairPrints
        case asyncSettingSharedValue
    }
    
    func execute(example: Example) {
        switch example {
        case .asyncAndSyncCallsSomeWithAfterDeadline: example0()
        case .asyncAndSyncCallsSomeWithSleepInside: example1()
        case .syncAndAsyncPairPrints: example2()
        case .asyncAndAsyncPairPrints: example3()
        case .syncAndSyncPairPrints: example4()
        case .asyncAndOutsidePairPrints:
            example5()
            example5()
            example5()
        case .asyncSettingSharedValue: example6()
        }
    }
    
    private func example0() {
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("CONCURRENT QUEUE: Different ASYNC and SYNC calls of numbers print, some of them with after deadline")
        print("Separator is outside of concurrent queue, after deadline: '1'+ 2s, '4'+ 5s")
        print()
        
        let concurrentQueue = DispatchQueue(label: "MyConcurrentQueue", attributes: .concurrent)
        
        concurrentQueue.sync {
            Utils.printManiac(value: "0", amount: 100)
        }
        Utils.printSeparator()
        
        concurrentQueue.asyncAfter(deadline: .now() + 2) {
            Utils.printManiac(value: "1", amount: 100)
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
        
        concurrentQueue.asyncAfter(deadline: .now() + 5) {
            Utils.printManiac(value: "4", amount: 100)
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
        
        print()
        sleep(10)
        Utils.printManiac(value: "🔳", amount: 50)
        print()
        print("Separator is inside concurrent queue, sleep: '1'+ 2s, '4'+ 5s")
        print()
        
        concurrentQueue.sync {
            Utils.printManiac(value: "0", amount: 100)
            Utils.printSeparator()
        }
        
        concurrentQueue.async {
            sleep(2)
            Utils.printManiac(value: "1", amount: 100)
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
    
    private func example1() {
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("CONCURRENT QUEUE: Different ASYNC and SYNC calls of numbers print, some of them with sleep inside")
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
        
        print()
        Utils.printManiac(value: "🔳", amount: 50)
        print()
        print("Separator is inside concurrent queue, after deadline: '1'+ 2s, '4'+ 5s")
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
        print("CONCURRENT QUEUE: 1 000 executions of pair print by sync and SYNC[⬜️] + ASYNC[⬛️]")
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
        print("CONCURRENT QUEUE: 1 000 executions of pair print by ASYNC[⬜️] + ASYNC[⬛️] ")
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
        print("CONCURRENT QUEUE: 1 000 executions of pair print by SYNC[⬜️] + SYNC[⬛️]")
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
    
    private func example5() {
        sleep(2)
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("CONCURRENT QUEUE: 1 000 executions of pair print by ASYNC[⬜️] + Outside[⬛️]")
        print()
        
        let concurrentQueue = DispatchQueue(label: "ConcurrentQueueExample", attributes: .concurrent)
        for _ in 0...1_000 {
            concurrentQueue.async {
                Utils.printManiac(value: "⬜️", amount: 1)
            }
            Utils.printManiac(value: "⬛️", amount: 1)
        }
    }
    
    private func example6() {
        print()
        print("CONCURRENT QUEUE: 1 000 executions of setting one shared variable")
        print()
        let writeConcurrentQueue = DispatchQueue(label: "WriteConcurrentQueueExample", attributes: .concurrent)
        for i in 0...100 {
            writeConcurrentQueue.async {
                example6value = i
            }
        }
    }
    
    private func example7() {
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("CONCURRENT QUEUE: Different ASYNC and SYNC calls of numbers print, some of them with sleep inside")
        print()
        
        let concurrentQueue = DispatchQueue(label: "MyConcurrentQueue", attributes: .concurrent)
        
        concurrentQueue.sync {
            Utils.printManiac(value: "0", amount: 100)
            Utils.printSeparator()
        }
        
        concurrentQueue.sync {
            sleep(2)
            Utils.printManiac(value: "+1", amount: 100)
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
            Utils.printManiac(value: "+4", amount: 100)
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
        
        concurrentQueue.sync {
            Utils.printManiac(value: "7", amount: 100)
            Utils.printSeparator()
        }
        
        sleep(10)
    }
}


var example6value: Int = 0

