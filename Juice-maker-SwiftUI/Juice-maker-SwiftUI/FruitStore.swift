//
//  FruitStore.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/28.
//

import Foundation

class FruitStore {
    static let initialStock = 10
    
    private(set) var strawberryStock: Int
    private(set) var bananaStock: Int
    private(set) var pineappleStock: Int
    private(set) var kiwiStock: Int
    private(set) var mangoStock: Int
    
    init(strawberryStock: Int = FruitStore.initialStock, bananaStock: Int = FruitStore.initialStock,
         pineappleStock: Int = FruitStore.initialStock, kiwiStock: Int = FruitStore.initialStock, mangoStock: Int = FruitStore.initialStock) {
        self.strawberryStock = strawberryStock
        self.bananaStock = bananaStock
        self.pineappleStock = pineappleStock
        self.kiwiStock = kiwiStock
        self.mangoStock = mangoStock
    }
    
    
}
