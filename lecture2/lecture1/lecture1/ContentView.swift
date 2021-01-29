//
//  ContentView.swift
//  lecture1
//
//  Created by Weilai Wang on 28/1/21.
//  Copyright © 2021 Weilai Wang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var ViewModel:EmojiMemoryGame
    
    var body: some View {
        
        return HStack(spacing:10){

            ForEach(ViewModel.cards) { card in
                
                cardview(card: card).onTapGesture {
                    self.ViewModel.choose(card:card)
                    
                }
            }
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
        
        ZStack(){
            if card.isFaceUp{
            RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
            RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                Text(card.content)
                
            }else{
            RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}





















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(ViewModel: EmojiMemoryGame())
    }
}
