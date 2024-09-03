//
//  ContentView.swift
//  Memorize
//
//  Created by Tianhi Devold on 01/09/2024.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    let emojis: [String] = ["🍁", "🪷", "🪲", "🐝", "🍁"] //same as Array<String>

    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
            
          
        }
        .foregroundColor(.blue)
        .padding()
    }
}

struct CardView: View {
    let content: String
    
    @State var isFaceUp = false
    
    var body: some View {
        ZStack(/*alignment: .center--> default*/) {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                    
                base .stroke(lineWidth: 2)
                Text(content)
                    .font(.largeTitle)
            } else {
                base.fill()
            }
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
