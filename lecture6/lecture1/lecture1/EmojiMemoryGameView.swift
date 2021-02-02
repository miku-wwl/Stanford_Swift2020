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
        VStack{
            Grid(ViewModel.cards){ card in
                cardview(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.75)){
                        self.ViewModel.choose(card:card)
                        
                    }
                }
                .padding(5)
            }
                .padding()
                .foregroundColor(Color.orange)
                .font(Font.largeTitle)
            Button(action: {withAnimation(Animation.easeInOut)
                {self.ViewModel.resetGame()} }, label: {Text("New Game")})
        }
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
    
    
    @State private var animatedBounsRemaining: Double = 0
    
    private func startBonusTimeAnimation(){
        animatedBounsRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusRemaining)){
            animatedBounsRemaining = 0
        }
    }
    @ViewBuilder
    private func body(for size:CGSize) ->some View{
        if card.isFaceUp || !card.isMatched{
        ZStack(){
            Group{
                if card.isConsumingBonusTime{
                    Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBounsRemaining*360-90),clockwise: true)
                        .onAppear(){
                            self.startBonusTimeAnimation()
                        }
                }else{
                    Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90),clockwise: true)
                        .padding(5).opacity(0.4)
                    
                }
            }
            .padding(5).opacity(0.4)
            .transition(.identity)
            
            Text(card.content)
                .font(Font.system(size: fontSize(for:size)))
                .rotationEffect(Angle.degrees(card.isMatched ? 360:0))
                .animation(card.isMatched ? Animation.linear.repeatForever(autoreverses: false) : . default)
            }
      //  .modifier(Cardify(isFaceUp: card.isFaceUp))
        
        .cardify(isFaceUp: card.isFaceUp)
        .transition(AnyTransition.scale)
        
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
