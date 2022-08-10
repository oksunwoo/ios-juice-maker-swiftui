//
//  JuiceMaker.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/08/03.
//

import Foundation

struct JuiceMaker {
    private(set) var fruitStore = FruitStore(chosenFruits: ChosenFruits.allCases, initialStock: 10)
    
    typealias Recipe = [Fruit: Int]
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case mangoJuice
        case strawberryBananaJuice
        case mangoKiwiJuice
        
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
        fruitStore.consumeFruits(for: recipe)
    }
}
