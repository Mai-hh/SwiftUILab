//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Maihao on 2022/1/26.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static let emojis = Theme.winter.emojis()
    
    static func creatMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model = creatMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
