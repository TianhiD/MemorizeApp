//
//  MemorizeLogic.swift
//  Memorize
//
//  Created by Tianhi Devold on 06/09/2024.
//

import Foundation


struct MemorizeLogic<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    struct Card{
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
