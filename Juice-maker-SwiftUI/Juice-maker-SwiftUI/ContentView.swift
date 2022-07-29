//
//  ContentView.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                JuiceMakerView()
                    .navigationTitle("맛있는 쥬스를 만들어드려요!")
                    .toolbar {
                        ToolbarItem {
                            Button {
                                
                            } label: {
                                Text("재고 수정")
                            }
                        }
                    }
            }
        }
    }
}

struct JuiceMakerView: View {
    var body: some View {
        VStack {
            HStack(spacing: 18) {
                FruitStockView(fruit: "🍓", stock: "10")
                FruitStockView(fruit: "🍌", stock: "10")
                FruitStockView(fruit: "🍍", stock: "10")
                FruitStockView(fruit: "🥝", stock: "10")
                FruitStockView(fruit: "🥭", stock: "10")
            }
            .padding()
            HStack(spacing: 25) {
                OrderButton(content: "딸기쥬스 주문", width: 120)
                OrderButton(content: "바나나쥬스 주문", width: 120)
                OrderButton(content: "파인애플쥬스 주문", width: 120)
                OrderButton(content: "키위쥬스 주문", width: 120)
                OrderButton(content: "망고쥬스 주문", width: 120)
            }
            HStack(spacing: 170) {
                OrderButton(content: "딸바쥬스 주문", width: 265)
                OrderButton(content: "망키쥬스 주문", width: 265)
            }
            .padding()
        }
    }
}

struct FruitStockView: View {
    let fruit: String
    let stock: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(fruit)
                .font(.system(size: 80))
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
                    RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                        .fill()
                        .foregroundColor(.gray.opacity(0.2))
                    Text(stock)
                    .font(.system(size: 30))
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: size.width * DrawingConstants.fontScale)
    }
}

struct OrderButton: View {
    let content: String
    let width: CGFloat
    
    var body: some View {
        Button {
            
        } label: {
            Text(content)
                .foregroundColor(.white)
                .frame(width: width, height: 50, alignment: .center)
                .multilineTextAlignment(.center)
        }
        .background(.blue.opacity(0.8))
        .border(.black)
        .cornerRadius(5)
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
