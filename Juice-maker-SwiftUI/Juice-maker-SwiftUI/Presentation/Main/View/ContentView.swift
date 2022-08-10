//
//  ContentView.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/27.
//

import SwiftUI

struct ContentView: View {
    let juiceMaker = JuiceMaker()
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
                        SingleJuiceOrderButton(juice: menu) {
                            
                        }
                    }
                }
                .navigationTitle("맛있는 쥬스를 만들어드려요!")
                
            }
        }
    }
}

struct FruitView: View {
    let fruit: Fruit
    
    var body: some View {
        VStack {
            Text(fruit.emoji)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill()
                    .foregroundColor(.gray)
                    .opacity(0.3)
                Text("\(fruit.amount)")
            }
        }
    }
}

struct SingleJuiceOrderButton: View {
    var juice: JuiceMaker.Juice
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            Text(juice.rawValue)
        }
        .foregroundColor(.white)
        .padding()
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
