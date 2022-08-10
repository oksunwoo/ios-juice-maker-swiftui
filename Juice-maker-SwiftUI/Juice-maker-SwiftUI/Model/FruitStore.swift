//
//  FruitStore.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/28.
//

import Foundation

class FruitStore {
    private(set) var fruits: [Fruit]
    
    init(chosenFruits: [ChosenFruits], initialStock: Int) {
        chosenFruits.forEach { fruit in
            fruits.append(Fruit(name: fruit.rawValue, emoji: fruit.emoji, amount: initialStock))
        }
    }
    
    func findIndexOf(_ fruit: Fruit) -> Int {
        for index in 0..<fruits.count {
            if fruits[index].name == fruit.name {
               return index
            }
        }
    }
    
    func getStockOf(_ fruit: Fruit) -> Int {
        let index = findIndexOf(fruit)
        let stock = fruits[index].amount
        
        return stock
    }
    
    func consumeFruits(for fruits: Fruit, amount: Int) {
        
    }

    func changeStock(of fruit: Fruit, amount: Int) {
        let index = findIndexOf(fruit)
        fruits[index].amount += amount
    }
}
