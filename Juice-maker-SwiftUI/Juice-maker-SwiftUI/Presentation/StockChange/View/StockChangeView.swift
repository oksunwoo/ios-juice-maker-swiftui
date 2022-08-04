//
//  StockChangeView.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/29.
//

import SwiftUI

struct StockChangeView: View {
    @Binding var showModal: Bool
    
    var body: some View {
        NavigationView {
            HStack(alignment: .top, spacing: 25) {
                StockStepper(fruit: "🍓")
                StockStepper(fruit: "🍌")
                StockStepper(fruit: "🍍")
                StockStepper(fruit: "🥝")
                StockStepper(fruit: "🥭")
            }
            .navigationTitle("재고추가")
            .toolbar {
                ToolbarItem {
                    Button {
                        showModal = false
                    } label: {
                        Text("닫기")
                    }
                }
            }
        }
    }
}

struct StockStepper: View {
    let fruit: String
    @State var stock = 10
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            FruitView(fruit: fruit)
            StockView(stock: stock)
            Stepper(value: $stock) {
                
            }
            .padding(.trailing)
        }
        .padding(.bottom, 80)
    }
}

struct StockChangeView_Previews: PreviewProvider {
    static var previews: some View {
        StockChangeView(showModal: .constant(true))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
