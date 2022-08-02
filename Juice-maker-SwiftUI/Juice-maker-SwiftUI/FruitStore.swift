//
//  FruitStore.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/28.
//

import Foundation

struct Fruit {
    var name: String
    var stock: Int
    
    init(name: String, stock: Int = FruitStore.initialStock) {
        self.name = name
        self.stock = stock
    }
}

class FruitStore {
    static let initialStock = 10
    
    init() {

    }
}
