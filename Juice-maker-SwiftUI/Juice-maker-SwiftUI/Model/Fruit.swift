//
//  Fruit.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/08/09.
//

import Foundation

struct Fruit: Identifiable {
    let name: String
    let emoji: String
    var amount: Int
    
    var id: String {
        self.name
    }
}

enum ChosenFruits: String, CaseIterable {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
    
    var emoji: String {
        switch self {
        case .strawberry:
            return "🍓"
        case .banana:
            return "🍌"
        case .kiwi:
            return "🥝"
        case .pineapple:
            return "🍍"
        case .mango:
            return "🥭"
        }
    }
}
