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
                        VStack {
                            FruitView(fruit: fruit)
                        }
                    }
                }
                HStack {
                    ForEach(fruits, id: \.self) { fruit in
                        StockChangeButton(fruit: fruit) {
                            juiceMaker.addStockOf(fruit)
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
    let fruit: ChosenFruits
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            Text("\(fruit.rawValue) \n 재고 추가")
        }
        .frame(width: 90)
        .foregroundColor(.white)
        .background(.blue)
        .cornerRadius(10)
    }
}




struct ChangeStockView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeStockView(showModal: .constant(false), juiceMaker: JuiceMaker())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
