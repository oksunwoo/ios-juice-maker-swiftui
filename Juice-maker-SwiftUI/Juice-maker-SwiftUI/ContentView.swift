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
                NavigationSetting()
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

struct NavigationSetting: View {
    var body: some View {
        Color.white
            .opacity(0.1)
            .ignoresSafeArea()
        
        VStack {
            Rectangle()
                .frame(height: 0)
                .background(.gray.opacity(0.2))
            HStack(spacing: 30) {
                FruitIconView(fruit: "🍓")
                FruitIconView(fruit: "🍌")
                FruitIconView(fruit: "🍍")
                FruitIconView(fruit: "🥝")
                FruitIconView(fruit: "🥭")
            }
            .padding()
            HStack(spacing: 18) {
                FruitStockView(stock: "10")
                FruitStockView(stock: "10")
                FruitStockView(stock: "10")
                FruitStockView(stock: "10")
                FruitStockView(stock: "10")
            }
            .padding()
            HStack(spacing: 18) {
                OrderButton(content: "딸기쥬스 주문")
                OrderButton(content: "바나나쥬스 주문")
                OrderButton(content: "파인애플쥬스 주문")
                OrderButton(content: "키위쥬스 주문")
                OrderButton(content: "망고쥬스 주문")
            }
        }
    }
}

struct FruitIconView: View {
    let fruit: String
    
    var body: some View {
        GeometryReader { geometry in
            Text(fruit)
                .font(font(in: geometry.size))
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: size.width * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
    }
}

struct FruitStockView: View {
    let stock: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill()
                .foregroundColor(.gray.opacity(0.2))
            Text(stock)
        }
    }
}

struct OrderButton: View {
    let content: String
    
    var body: some View{
        Button {
            
        } label: {
            Text(content)
                .foregroundColor(.white)
        }
        .background(.blue.opacity(0.8))
        .border(.black)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
