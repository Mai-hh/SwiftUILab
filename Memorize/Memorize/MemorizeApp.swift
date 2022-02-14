//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Maihao on 2022/1/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
