//
//  ChangeStockView.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/08/11.
//

import SwiftUI

struct ChangeStockView: View {
    @Binding var showModal: Bool
    @StateObject var juiceMaker: JuiceMaker
    let fruits = ChosenFruits.allCases
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(juiceMaker.fruitStore.fruits) { fruit in
                            FruitView(fruit: fruit)
                    }
                }
                HStack(spacing: 70) {
                    ForEach(fruits, id: \.self) { fruit in
                        StockChangeButton {
                            juiceMaker.addStockOf(fruit)
                        } subtractAction: {
                            juiceMaker.subtractStockOf(fruit)
                        }

                    }
                }
            }
                .navigationTitle("재고추가")
                .toolbar {
                    Button("닫기") {
                        self.showModal = false
                    }
                }
        }
    }
}

struct StockChangeButton: View {
    var addAction: (() -> Void)
    var subtractAction: (() -> Void)
    
    var body: some View {
        HStack {
            Button(action: addAction) {
                Text("+")
            }
            Text("|")
            Button(action: subtractAction) {
                Text("-")
            }
        }
        .frame(width: 80, height: 40)
        .background(.gray)
        .opacity(0.3)
        .foregroundColor(.black)
        .cornerRadius(10)
    }
}




struct ChangeStockView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeStockView(showModal: .constant(false), juiceMaker: JuiceMaker())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
