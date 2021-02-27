//
//  DispatchGroupExample.swift
//  GCD-Multithreading
//
//  Created by Danyl Timofeyev on 27.02.2021.
//

import Foundation

struct DispatchGroupExample: CommandType {
    
    enum Example {
        case example0
       
    }
    
    func execute(example: Example) {
        switch example {
        case .example0:
            example0()
            example0()
            example0()
            example0()
            example0()

        }
    }
    
    let group0 = DispatchGroup()
    private func example0() {
                
        group0.enter()
        DispatchQueue.global().async {
            sleep(3)
            Utils.printManiac(value: "🟩", amount: 5)
            print("\n")
            group0.leave()
        }
        
        group0.enter()
        DispatchQueue.global().async {
            sleep(2)
            Utils.printManiac(value: "🟫", amount: 5)
            print("\n")
            group0.leave()
        }
        
        group0.enter()
        DispatchQueue.global().async {
            sleep(1)
            Utils.printManiac(value: "🟦", amount: 5)
            print("\n")
            group0.leave()
        }
        
        group0.wait()

        Utils.printManiac(value: "⬜️", amount: 100)
        print("\n")
                                
    }
    
  
}
