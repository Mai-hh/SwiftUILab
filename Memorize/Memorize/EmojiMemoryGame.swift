//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Maihao on 2022/1/26.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣"]
    
    static func creatMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.creatMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
