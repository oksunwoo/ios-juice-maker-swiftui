//
//  FruitStore.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/28.
//

import Foundation

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }

    private(set) var fruitStock: [Fruit:Int]
    
    init(initialStock: Int) {
        let fruits = Fruit.allCases
        let fruitCount = Array(repeating: initialStock, count: fruits.count)
        
        fruitStock = Dictionary(uniqueKeysWithValues: zip(fruits, fruitCount))
    }
    
    func showStockOf(fruit: Fruit) -> Int? {
        guard let currentStock = fruitStock[fruit] else {
            return nil
        }
        
        return currentStock
    }
    
    func consumeFruits(for fruits: [Fruit: Int]) {
        for (fruit, amount) in fruits {
            let fruit = [fruit: amount * -1]
            changeStock(of: fruit)
        }
    }

    func changeStock(of fruits: [Fruit:Int]) {
        for (fruit, amount) in fruits {
            guard let currentStock = fruitStock[fruit] else {
                return
            }
            
            fruitStock.updateValue(currentStock + amount, forKey: fruit)
        }
    }
}
