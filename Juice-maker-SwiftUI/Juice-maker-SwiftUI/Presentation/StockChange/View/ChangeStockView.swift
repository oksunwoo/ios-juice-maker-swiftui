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
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(juiceMaker.fruitStore.fruits) { fruit in
                        VStack {
                            FruitView(fruit: fruit)
                            //StockStepper(fruit: fruit)
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

struct StockStepper: View {
    @Binding var fruit: Fruit
    
    var body: some View {
        Stepper(value: $fruit.amount) {
            Text("\(fruit.amount)")
        }
    }
}





struct ChangeStockView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeStockView(showModal: .constant(false), juiceMaker: JuiceMaker())
            .previewInterfaceOrientation(.landscapeRight)
    }
}
