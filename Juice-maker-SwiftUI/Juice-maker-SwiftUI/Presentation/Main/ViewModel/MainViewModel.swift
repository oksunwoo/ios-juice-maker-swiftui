//
//  MainViewModel.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/08/04.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var model = JuiceMaker()
    
    init() {
        
    }
    
    func match(fruit: Fruits) -> FruitStore.Fruit {
        switch fruit {
        case .strawberry:
            return .strawberry
        case .banana:
            return .banana
        case .pineapple:
            return .pineapple
        case .kiwi:
            return .kiwi
        case .mango:
            return .mango
        }
    }
    
    func match(juice: OrderButton.Juice) -> JuiceMaker.Juice {
        switch juice {
        case .strawberryJuice:
            return .strawberryJuice
        case .bananaJuice:
            return .bananaJuice
        case .pineappleJuice:
            return .pineappleJuice
        case .kiwiJuice:
            return .kiwiJuice
        case .mangoJuice:
            return .mangoJuice
        case .strawberryBananaJuice:
            return .strawberryBananaJuice
        case .mangoKiwiJuice:
            return .mangoKiwiJuice
        }
    }
    
    func order(juice: OrderButton.Juice) {
        let juice = match(juice: juice)
        model.make(juice)
    }
    
    func showStockOf(fruit: Fruits) -> Int {
        let fruit = match(fruit: fruit)
        guard let stock = model.fruitStore.getStockOf(fruit) else {
            return 0
        }
        
        return stock
    }
}
