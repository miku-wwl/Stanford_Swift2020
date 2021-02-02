//
//  Cardify.swift
//  lecture1
//
//  Created by mac on 2021/1/30.
//  Copyright © 2021 Weilai Wang. All rights reserved.
//

import SwiftUI
struct Cardify: AnimatableModifier	{
    var rotation: Double
    var isFaceUp: Bool {
        rotation < 90
    }
    init(isFaceUp: Bool){
        rotation = isFaceUp ? 0:180
    }
    
    var animatableData: Double{
        get{return rotation}
        set{rotation = newValue}
    }
    
    
    func body(content: Content) ->some View{
        ZStack{
            if isFaceUp{
            RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
            content
                
            }else{
            
                RoundedRectangle(cornerRadius: cornerRadius).fill()
               
            }
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
        
    }
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    
   
    
}

extension View{
    func cardify(isFaceUp:Bool) -> some View{
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
