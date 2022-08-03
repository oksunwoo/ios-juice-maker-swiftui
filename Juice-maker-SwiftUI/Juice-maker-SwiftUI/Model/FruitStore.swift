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
    
    func changeFruitStock(for fruits: [Fruit:Int]) {
        for (fruit, amount) in fruits {
            guard let currentStock = fruitStock[fruit] else {
                return
            }
            
            fruitStock.updateValue(currentStock + amount, forKey: fruit)
        }
    }
}
