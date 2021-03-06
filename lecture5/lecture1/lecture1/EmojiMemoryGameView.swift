//
//  EmojiMemoryGameView.swift
//  lecture1
//
//  Created by Weilai Wang on 28/1/21.
//  Copyright © 2021 Weilai Wang. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var ViewModel:EmojiMemoryGame
    
    var body: some View {
        
        Grid(ViewModel.cards){ card in
            cardview(card: card).onTapGesture {
                self.ViewModel.choose(card:card)
            }
            .padding(5)
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    }
}


struct cardview: View{
  //  var isFaceUp:Bool
    
    var card: MemoryGame<String>.Card
    
    
    
    
    
    var body:some View{
        GeometryReader{ geometry in
            self.body(for:geometry.size)
        }
        
    }
    
    @ViewBuilder
    private func body(for size:CGSize) ->some View{
        if card.isFaceUp || !card.isMatched{
        ZStack(){
            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90),clockwise: true)
            .padding(5).opacity(0.4)
            Text(card.content)
                .font(Font.system(size: fontSize(for:size)))
            }
      //  .modifier(Cardify(isFaceUp: card.isFaceUp))
        
        .cardify(isFaceUp: card.isFaceUp)
        }
    }
   
    
    
    //mark drawing constants
   
    private func fontSize(for size:CGSize) -> CGFloat{
        min(size.width, size.height)*fontScaleFactor
        
    }
    private let fontScaleFactor: CGFloat = 0.7
    
}





















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
     //   game.choose(card: game.cards[0])
        
        return EmojiMemoryGameView(ViewModel: game)
    }
}
