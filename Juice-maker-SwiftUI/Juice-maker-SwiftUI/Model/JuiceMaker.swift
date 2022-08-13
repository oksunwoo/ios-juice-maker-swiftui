//
//  JuiceMaker.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/08/03.
//

import Foundation

class JuiceMaker: ObservableObject {
    @Published private(set) var fruitStore = FruitStore(chosenFruits: chosenFruits, initialStock: 10)
    static let chosenFruits = ChosenFruits.allCases
    typealias Recipe = [ChosenFruits: Int]
    
    enum Juice: String, CaseIterable {
        case strawberryJuice = "딸기쥬스"
        case bananaJuice = "바나나쥬스"
        case kiwiJuice = "키위쥬스"
        case pineappleJuice = "파인애플쥬스"
        case mangoJuice = "망고쥬스"
        case strawberryBananaJuice = "딸바쥬스"
        case mangoKiwiJuice = "망키쥬스"
        
        var recipe: Recipe {
            switch self {
            case .strawberryJuice:
                return [.strawberry: 16]
            case .bananaJuice:
                return [.banana: 2]
            case .kiwiJuice:
                return [.kiwi: 3]
            case .pineappleJuice:
                return [.pineapple: 2]
            case .mangoJuice:
                return [.mango: 3]
            case .strawberryBananaJuice:
                return [.strawberry: 10, .banana: 1]
            case .mangoKiwiJuice:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    func make(_ juice: Juice) {
        let recipe = juice.recipe
        for (fruit, amount) in recipe {
            fruitStore.consumeFruits(for: fruit, amount: amount)
        }
    }
    
    func addStockOf(_ fruit: ChosenFruits) {
        fruitStore.changeStock(of: fruit, amount: 1)
    }
    
    func subtractStockOf(_ fruit: ChosenFruits) {
        fruitStore.changeStock(of: fruit, amount: -1)
    }
}
