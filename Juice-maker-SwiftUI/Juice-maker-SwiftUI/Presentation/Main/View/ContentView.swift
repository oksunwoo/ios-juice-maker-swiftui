//
//  ContentView.swift
//  Juice-maker-SwiftUI
//
//  Created by Sunwoo on 2022/07/27.
//

import SwiftUI

struct ContentView: View {
    let juiceMaker = JuiceMaker()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(juiceMaker.fruitStore.fruits) { fruit in
                        FruitView(fruit: fruit)
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
                RoundedRectangle(cornerRadius: 20)
                    .fill()
                    .foregroundColor(.gray)
                    .opacity(0.3)
                Text("\(fruit.amount)")
            }
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
