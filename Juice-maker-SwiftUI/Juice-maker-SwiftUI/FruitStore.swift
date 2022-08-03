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

    private(set) var fruitStock: [Fruit:Int]
    
    init() {
        let fruits = Fruit.allCases
        let fruitCount = Array(repeating: FruitStore.initialStock, count: fruits.count)
        
        fruitStock = Dictionary(uniqueKeysWithValues: zip(fruits, fruitCount))
    }
    
    func change(amount: Int, of fruit: Fruit) {
        guard var stock = fruitStock[fruit] else {
            return
        }
        
        stock += amount
    }
}
