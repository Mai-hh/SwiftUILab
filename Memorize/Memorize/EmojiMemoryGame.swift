//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Maihao on 2022/1/26.
//

import SwiftUI

class EmojiMemoryGame {
    
    static let emojis = ["😀", "😃", "😄", "😁","😆","😅","😂","🤣"]
    
    static func creatMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.creatMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
}
