//
//  FruitStore.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/28.
//

import Foundation

class FruitStore {
    private(set) var fruits: [Fruit]
    
    init(chosenFruits:[ChosenFruits], initialStock: Int) {
        chosenFruits.forEach { fruit in
            fruits.append(Fruit(name: fruit.rawValue, emoji: fruit.emoji, amount: initialStock))
        }
    }
    
    func getStockOf(_ fruit: Fruit) -> Int {
        guard let currentStock = fruitStock[fruit] else {
            return -1
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
