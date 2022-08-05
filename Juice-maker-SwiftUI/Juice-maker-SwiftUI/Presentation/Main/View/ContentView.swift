//
//  ContentView.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/27.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    
    var body: some View {
        NavigationView {
            JuiceMakerView()
                .navigationTitle("맛있는 쥬스를 만들어드려요!")
                .toolbar {
                    ToolbarItem {
                        Button {
                            self.showModal = true
                        } label: {
                            Text("재고 수정")
                        }
                        .sheet(isPresented: self.$showModal) {
                            StockChangeView(showModal: $showModal)
                        }
                    }
                }
        }
    }
}

struct JuiceMakerView: View {
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 60) {
                FruitView(fruit: .strawberry)
                FruitView(fruit: .banana)
                FruitView(fruit: .pineapple)
                FruitView(fruit: .kiwi)
                FruitView(fruit: .mango)
            }
            HStack(spacing: 25) {
                StockView(fruit: .strawberry)
                StockView(fruit: .banana)
                StockView(fruit: .pineapple)
                StockView(fruit: .kiwi)
                StockView(fruit: .mango)
            }
            HStack(spacing: 25) {
                OrderButton(juice: .strawberryJuice, width: 120)
                OrderButton(juice: .bananaJuice, width: 120)
                OrderButton(juice: .pineappleJuice, width: 120)
                OrderButton(juice: .kiwiJuice, width: 120)
                OrderButton(juice: .mangoJuice, width: 120)
            }
            HStack(spacing: 170) {
                OrderButton(juice: .strawberryBananaJuice, width: 265)
                OrderButton(juice: .mangoKiwiJuice, width: 265)
            }
        }
    }
}

struct FruitView: View {
    let fruit: Fruits
    
    var body: some View {
        VStack(spacing: 10) {
            Text(fruit.emoji)
                .font(.system(size: 80))
        }
    }
}

struct StockView: View {
    @ObservedObject var viewModel = MainViewModel()
    let fruit: Fruits
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                    .fill()
                    .foregroundColor(.gray.opacity(0.2))
                    .frame(width: 120, height: 50)
            Text("\(viewModel.showStockOf(fruit: fruit))")
                .font(.system(size: 30))
        }
    }
}

struct OrderButton: View {
    let juice: Juice
    let width: CGFloat
    
    var body: some View {
        Button {
            
        } label: {
            Text(juice.description + " 주문")
                .foregroundColor(.white)
                .frame(width: width, height: 50, alignment: .center)
                .multilineTextAlignment(.center)
        }
        .background(.blue.opacity(0.8))
        .border(.black)
        .cornerRadius(5)
    }
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case mangoJuice
        case strawberryBananaJuice
        case mangoKiwiJuice
        
        var description: String {
            switch self {
            case .strawberryJuice:
                return "딸기쥬스"
            case .bananaJuice:
                return "바나나쥬스"
            case .pineappleJuice:
                return "파인애플쥬스"
            case .kiwiJuice:
                return "키위쥬스"
            case .mangoJuice:
                return "망고쥬스"
            case .strawberryBananaJuice:
                return "딸바쥬스"
            case .mangoKiwiJuice:
                return "망키쥬스"
            }
        }
    }
}

enum Fruits {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    var emoji: String {
        switch self {
        case .strawberry:
            return "🍓"
        case .banana:
            return "🍌"
        case .pineapple:
            return "🍍"
        case .kiwi:
            return "🥝"
        case .mango:
            return "🥭"
        }
    }
}

private struct DrawingConstants {
    static let cornerRadius: CGFloat = 20
    static let fontScale: CGFloat = 0.4
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
