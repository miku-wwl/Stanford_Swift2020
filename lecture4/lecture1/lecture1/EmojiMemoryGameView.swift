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
    
    func body(for size:CGSize) ->some View{
        ZStack(){
            if card.isFaceUp{
            RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                Text(card.content)
                
            }else{
            RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
        .font(Font.system(size: fontSize(for:size)))
    }
    
    //mark drawing constants
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size:CGSize) -> CGFloat{
        min(size.width, size.height)*fontScaleFactor
        
    }
}





















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(ViewModel: EmojiMemoryGame())
    }
}
