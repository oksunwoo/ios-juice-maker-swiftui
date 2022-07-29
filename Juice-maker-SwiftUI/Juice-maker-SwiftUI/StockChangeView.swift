//
//  StockChangeView.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/29.
//

import SwiftUI

struct StockChangeView: View {
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    HStack(spacing: 18) {
                        FruitStockView(fruit: "🍓", stock: "10")
                        FruitStockView(fruit: "🍌", stock: "10")
                        FruitStockView(fruit: "🍍", stock: "10")
                        FruitStockView(fruit: "🥝", stock: "10")
                        FruitStockView(fruit: "🥭", stock: "10")
                    }
                    .padding()
                    HStack {
                        StockStepper()
                        StockStepper()
                        StockStepper()
                        StockStepper()
                        StockStepper()
                    }
                    .padding()
                }
            }
            .navigationTitle("재고추가")
            .toolbar {
                ToolbarItem {
                    Button {
                        
                    } label: {
                        Text("닫기")
                    }

                }
            }
        }
    }
}

struct StockStepper: View {
    @State var stock = 10
    
    var body: some View {
        Stepper(value: $stock) {
            
        }
    }
}

struct StockChangeView_Previews: PreviewProvider {
    static var previews: some View {
        StockChangeView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
