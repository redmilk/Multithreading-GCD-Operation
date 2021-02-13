//
//  CommandType.swift
//  Multithreading
//
//  Created by Danyl Timofeyev on 12.02.2021.
//

import Foundation

protocol CommandType {
    associatedtype Example
    func execute(example: Example)
}
