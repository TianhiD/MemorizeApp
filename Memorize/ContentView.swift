//
//  ContentView.swift
//  Memorize
//
//  Created by Tianhi Devold on 01/09/2024.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    let emojis: [String] =
    ["🪷", "🪲", "🐝", "🍁", "🥀", "🍀", "🐞", "🦋", "🪷", "🪲", "🐝", "🍁", "🥀", "🍀", "🐞", "🦋"] //same as Array<String>
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.mint)
    }
    var cardCountAdjusters: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset > emojis.count || cardCount + offset < 1)
    }
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.fill.badge.plus")
    }
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.fill.badge.minus")
    }
}

struct CardView: View {
    let content: String
    
    @State var isFaceUp = false
    var body: some View {
        ZStack(/*alignment: .center--> default*/) {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base .stroke(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
           // isFaceUp = !isFaceUp is the same as:
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
