//
//  ContentView.swift
//  lecture1
//
//  Created by Weilai Wang on 28/1/21.
//  Copyright © 2021 Weilai Wang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        return HStack(spacing:10){

            ForEach(0..<4) { index in
             cardview(isFaceUp: false)
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    }
}


struct cardview: View{
    var isFaceUp:Bool
    var body:some View{
        
        ZStack(){
            if isFaceUp{
            RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
            RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
            Text("👻")
                
            }else{
            RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}





















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
