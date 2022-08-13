//
//  ContentView.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/27.
//

import SwiftUI

struct ContentView: View {
    @State var showModal = false
    @StateObject var juiceMaker = JuiceMaker()
    
    let juiceMenu = JuiceMaker.Juice.allCases
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(juiceMaker.fruitStore.fruits) { fruit in
                        FruitView(fruit: fruit)
                    }
                }
                HStack {
                    ForEach(juiceMenu, id: \.self) { menu in
                        JuiceOrderButton(juice: menu) {
                            juiceMaker.make(menu)
                        }
                    }
                }
                .navigationTitle("맛있는 쥬스를 만들어드려요!")
                .toolbar {
                    Button("재고수정") {
                        showModal.toggle()
                    }
                    .sheet(isPresented: $showModal) {
                        ChangeStockView(showModal: self.$showModal, juiceMaker: juiceMaker)
                    }
                }
            }
        }
    }
}

struct FruitView: View {
    let fruit: Fruit
    
    var body: some View {
        VStack(spacing: 0) {
            Text(fruit.emoji)
                .font(.system(size: 90))
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill()
                    .foregroundColor(.gray)
                    .opacity(0.3)
                Text("\(fruit.amount)")
            }
            .frame(width: 110, height: 50)
            .padding()
        }
    }
}

struct JuiceOrderButton: View {
    @State private var showing = false
    var juice: JuiceMaker.Juice
    var clicked: (() -> Void)
    
    var body: some View {
        Button(juice.rawValue) {
            clicked()
            showing = true
        }
        .alert(juice.rawValue + " 나왔습니다! \n 맛있게 드세요 🐸", isPresented: $showing) {
            Button(role: .none) {
                
            } label: {
                Text("OK")
            }
        }
        .frame(width: 100, height: 50)
        .foregroundColor(.white)
        .background(.blue)
        .cornerRadius(10)
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
