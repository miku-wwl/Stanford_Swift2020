//
//  EmojiMemoryGame.swift
//  lecture1
//
//  Created by Weilai Wang on 28/1/21.
//  Copyright © 2021 Weilai Wang. All rights reserved.
//

import SwiftUI




class EmojiMemoryGame: ObservableObject {
    
    @Published private var model:MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻","🎃","🕷"]
        return  MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
            
        }
    }
    
    
    // mark: - access to the model
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    
    //mark: -intent
    func choose(card: MemoryGame<String>.Card){
   //     objectWillChange.send()
        
        model.choose(card: card)
    }
    
    
    func resetGame() -> Void{
        model = EmojiMemoryGame.createMemoryGame()
    }
}
