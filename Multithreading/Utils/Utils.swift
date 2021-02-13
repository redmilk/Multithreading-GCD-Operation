//
//  Utils.swift
//  Multithreading
//
//  Created by Danyl Timofeyev on 12.02.2021.
//

import Foundation


struct Utils {
    
    static func printManiac(value: String, amount: Int) {
        let array: [String] = [String](repeating: value, count: amount)
        array.forEach { print($0, terminator: "") }
    }
    
    static func printSeparator() {
        print()
        printManiac(value: "⬜️", amount: 10)
        print()
    }
    
}
