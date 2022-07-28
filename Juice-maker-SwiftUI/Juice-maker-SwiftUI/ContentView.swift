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
                .background(Color.gray.opacity(0.2))
            HStack {
                Spacer()
                FruitIconView(fruit: "🍓")
                Spacer()
                FruitIconView(fruit: "🍌")
                Spacer()
                FruitIconView(fruit: "🍍")
                Spacer()
                FruitIconView(fruit: "🥝")
                Spacer()
                FruitIconView(fruit: "🥭")
            }
                .padding()
            //Spacer()
        }
    }
}

struct FruitIconView: View {
    var fruit: String
    
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








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
