//
//  FruitStore.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/28.
//

import Foundation

class FruitStore {
    private(set) var fruits: [Fruit] = []
    
    init(chosenFruits: [ChosenFruits], initialStock: Int) {
        chosenFruits.forEach { fruit in
            fruits.append(Fruit(name: fruit.rawValue, emoji: fruit.emoji, amount: initialStock))
        }
    }
    
    func findIndexOf(_ fruit: ChosenFruits) -> Int {
        for index in 0..<fruits.count {
            if fruits[index].name == fruit.rawValue {
               return index
            }
        }
        
        return -1
    }
    
    func getStockOf(_ fruit: ChosenFruits) -> Int {
        let index = findIndexOf(fruit)
        let stock = fruits[index].amount
        
        return stock
    }
    
    func consumeFruits(for fruit: ChosenFruits, amount: Int) {
        changeStock(of: fruit, amount: amount * -1)
    }

    func changeStock(of fruit: ChosenFruits, amount: Int) {
        let index = findIndexOf(fruit)
        fruits[index].amount += amount
    }
}
