//
//  FruitStore.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/28.
//

import Foundation

class FruitStore {
    static let initialStock = 10
    
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }

    private(set) var fruitstock: [Fruit:Int]
    
    init() {
        let fruits = Fruit.allCases
        let fruitCount = Array(repeating: FruitStore.initialStock, count: fruits.count)
        
        fruitstock = Dictionary(uniqueKeysWithValues: zip(fruits, fruitCount))
    }
}
