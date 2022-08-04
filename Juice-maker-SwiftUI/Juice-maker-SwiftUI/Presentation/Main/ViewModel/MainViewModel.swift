//
//  MainViewModel.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/08/04.
//

import Foundation

class MainViewModel {
    var model = JuiceMaker()
    
    init() {
        
    }
    
    func matchFruitWithStock(view: StockView) -> FruitStore.Fruit {
        switch view.fruit {
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
}
