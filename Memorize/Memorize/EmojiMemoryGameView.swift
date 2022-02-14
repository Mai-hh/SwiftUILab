//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Maihao on 2022/1/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
//    @ObservedObject var theme: MemoryGameTheme
    
    var body: some View {
        VStack {
            gameBody
            shuffleButton
        }
        .padding()
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
            if card.isMatched && !card.isFaceUp {
                Color.clear
            } else {
                CardView(card)
                    .padding(4)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        withAnimation {
                            game.choose(card)
                        }
                }
            }
        })
        .foregroundColor(.red)
    }
    
    var shuffleButton: some View {
        Button(" ") {
            withAnimation(.easeInOut(duration: 1)) {
                game.shuffle()
            }
        }
    }
}

struct CardView: View {
    private let card: EmojiMemoryGame.Card
    
    init(_ card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                    .padding(5).opacity(0.5)
                Text(card.content)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false))
                    .scaleEffect(scale(thatFits: geometry.size))
                    .font(.system(size:DrawingConstants.fontSize))
            }
            .cardify(isFaceUp: card.isFaceUp)
        })
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.7
        static let fontSize: CGFloat = 32
    }
    
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
    
}
