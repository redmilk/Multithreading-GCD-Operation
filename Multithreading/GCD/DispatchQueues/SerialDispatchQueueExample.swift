//
//  GCD-Features.swift
//  GCD-Multithreading
//
//  Created by Danyl Timofeyev on 12.02.2021.
//

import Foundation

/**

 We can just take queue from global pool of queues `Dispatch.global()`
 All global queues are cuncurrent, exception is `DispatchQueue.main` - is serial global queue
 This global pool of queues is used by system, and it's not recommended for using them for heavy tasks
 Better to create custom DispatchQueue instead
 
 
 */


struct SerialDispatchQueueExample: CommandType {

    enum Example {
        case asyncAndSyncCallsSomeWithAfterDeadline
        case asyncAndSyncCallsSomeWithSleepInside
        case syncAndAsyncPairPrints
        case asyncAndAsyncPairPrints
        case syncAndSyncPairPrints
        case asyncAndOutsidePairPrints
        case example6
    }
    
    func execute(example: Example) {
        switch example {
        case .asyncAndSyncCallsSomeWithAfterDeadline: example0()
        case .asyncAndSyncCallsSomeWithSleepInside: example1()
        case .syncAndAsyncPairPrints: example2()
        case .asyncAndAsyncPairPrints:
            example3()
            example3()
            example3()
            example3()
            example3()
            example3()

        case .syncAndSyncPairPrints: example4()
        case .asyncAndOutsidePairPrints:
            example5()
            example5()
            example5()
        case .example6:
            example6()
            example6()
            example6()
            example6()
        }
    }
    
    private func example0() {
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("SERIAL QUEUE: Different ASYNC and SYNC calls of numbers print, some of ASYNC with after deadline")
        print("Separator is outside of serial queue, after deadline: '1'+ 2s, '4'+ 5s")
        print()
        let serialQueue = DispatchQueue(label: "MySerialQueue")
        
        serialQueue.sync {
            Utils.printManiac(value: "0", amount: 100)
        }
        Utils.printSeparator()
                
        serialQueue.asyncAfter(deadline: .now() + 2) {
            Utils.printManiac(value: "1", amount: 100)
        }
        Utils.printSeparator()
        
        serialQueue.async {
            Utils.printManiac(value: "2", amount: 100)
        }
        Utils.printSeparator()
        
        serialQueue.sync {
            Utils.printManiac(value: "3", amount: 100)
        }
        Utils.printSeparator()
       
        serialQueue.asyncAfter(deadline: .now() + 5) {
            Utils.printManiac(value: "4", amount: 100)
        }
        Utils.printSeparator()
        
        serialQueue.async {
            Utils.printManiac(value: "5", amount: 100)
        }
        Utils.printSeparator()
        
        serialQueue.sync {
            Utils.printManiac(value: "6", amount: 100)
        }
        Utils.printSeparator()
        
        sleep(10)
        print()
        Utils.printManiac(value: "🔳", amount: 50)
        print()
        print("Separator is inside serial queue, after deadline: '1'+ 2s, '4'+ 5s")
        print()
        
        serialQueue.sync {
            Utils.printManiac(value: "0", amount: 100)
            Utils.printSeparator()
        }
        
        serialQueue.asyncAfter(deadline: .now() + 2) {
            Utils.printManiac(value: "1", amount: 100)
            Utils.printSeparator()
        }
        
        serialQueue.async {
            Utils.printManiac(value: "2", amount: 100)
            Utils.printSeparator()
        }
        
        serialQueue.sync {
            Utils.printManiac(value: "3", amount: 100)
            Utils.printSeparator()
        }
       
        serialQueue.asyncAfter(deadline: .now() + 5) {
            Utils.printManiac(value: "4", amount: 100)
            Utils.printSeparator()
        }
        
        serialQueue.async {
            Utils.printManiac(value: "5", amount: 100)
            Utils.printSeparator()
        }
        
        serialQueue.sync {
            Utils.printManiac(value: "6", amount: 100)
            Utils.printSeparator()
        }
        sleep(10)
    }
    
    private func example1() {
        print()
        print()
        Utils.printManiac(value: "⚙️", amount: 50)
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("SERIAL QUEUE: Different ASYNC and SYNC calls of numbers print, some of them with sleep inside")
        print()
        
        let serialQueue = DispatchQueue(label: "MySerialQueue")
        
        serialQueue.sync {
            Utils.printManiac(value: "0", amount: 100)
        }
        Utils.printSeparator()
        
        serialQueue.async {
            sleep(2)
            Utils.printManiac(value: "1", amount: 100)
        }
        Utils.printSeparator()
        
        serialQueue.async {
            Utils.printManiac(value: "2", amount: 100)
        }
        Utils.printSeparator()
        
        serialQueue.sync {
            Utils.printManiac(value: "3", amount: 100)
        }
        Utils.printSeparator()
       
        serialQueue.async {
            sleep(5)
            Utils.printManiac(value: "4", amount: 100)
        }
        Utils.printSeparator()
        
        serialQueue.async {
            Utils.printManiac(value: "5", amount: 100)
        }
        Utils.printSeparator()
        
        serialQueue.sync {
            Utils.printManiac(value: "6", amount: 100)
        }
        Utils.printSeparator()
        
        sleep(6)
        print()
        Utils.printManiac(value: "🔳", amount: 50)
        print()
        print("Separator is inside serial queue, sleep: '1'+ 2s, '4'+ 5s")
        print()
        
        serialQueue.sync {
            Utils.printManiac(value: "0", amount: 100)
            Utils.printSeparator()
        }
        
        serialQueue.async {
            sleep(2)
            Utils.printManiac(value: "1", amount: 100)
            Utils.printSeparator()
        }
        
        serialQueue.async {
            Utils.printManiac(value: "2", amount: 100)
            Utils.printSeparator()
        }
        
        serialQueue.sync {
            Utils.printManiac(value: "3", amount: 100)
            Utils.printSeparator()
        }
       
        serialQueue.async {
            sleep(5)
            Utils.printManiac(value: "4", amount: 100)
            Utils.printSeparator()
        }
        
        serialQueue.async {
            Utils.printManiac(value: "5", amount: 100)
            Utils.printSeparator()
        }
        
        serialQueue.sync {
            Utils.printManiac(value: "6", amount: 100)
            Utils.printSeparator()
        }
        
    }
    
    private func example2() {
        sleep(2)
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("SERIAL QUEUE: 1 000 executions of pair print by sync and SYNC[⬜️] + ASYNC[⬛️]")
        print()
        
        let serialQueue = DispatchQueue(label: "SerialQueueExample")
        for _ in 0...1_000 {
            serialQueue.sync {
                Utils.printManiac(value: "⬜️", amount: 1)
            }
            serialQueue.async {
                Utils.printManiac(value: "⬛️", amount: 1)
            }
        }
    }
    
    private func example3() {
        sleep(2)
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("SERIAL QUEUE: 1 000 executions of pair print by ASYNC[⬜️] + ASYNC[⬛️] ")
        print()
        
        let serialQueue = DispatchQueue(label: "SerialQueueExample")
        for _ in 0...1_000 {
            serialQueue.async {
                Utils.printManiac(value: "⬜️", amount: 1)
            }
            serialQueue.async {
                Utils.printManiac(value: "⬛️", amount: 1)
            }
        }
    }
    
    private func example4() {
        sleep(2)
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("SERIAL QUEUE: 1 000 executions of pair print by SYNC[⬜️] + SYNC[⬛️]")
        print()
        
        let serialQueue = DispatchQueue(label: "SerialQueueExample")
        for _ in 0...1_000 {
            serialQueue.sync {
                Utils.printManiac(value: "⬜️", amount: 1)
            }
            serialQueue.sync {
                Utils.printManiac(value: "⬛️", amount: 1)
            }
        }
    }
    
    private func example5() {
        sleep(2)
        print()
        Utils.printManiac(value: "🏁", amount: 10)
        print()
        print("SERIAL QUEUE: 1 000 executions of pair print by ASYNC[⬜️] + Outside[⬛️]")
        print()
        
        let serialQueue = DispatchQueue(label: "SerialQueueExample")
        for _ in 0...1_000 {
            serialQueue.async {
                Utils.printManiac(value: "⬜️", amount: 1)
            }
            Utils.printManiac(value: "⬛️", amount: 1)
        }
        
        sleep(10)
    }
    
    private func example6() {
        sleep(3)
        print("Simulating network request")

        let serialQueue = DispatchQueue(label: "SerialQueue")
        
        serialQueue.async {
            DispatchQueue.global().async {
                sleep(2)
                Utils.printManiac(value: "⬜️", amount: 10)
            }
        }
        
        serialQueue.async {
            DispatchQueue.global().async {
                Utils.printManiac(value: "⬛️", amount: 10)
            }
        }
        
    }
}
