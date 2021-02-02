//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by mac on 2021/2/2.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    
    var body: some View {
        VStack{
            ScrollView(.horizontal){
                HStack{
                    ForEach(EmojiArtDocument.palette.map{String($0)}, id: \.self){emoji in
                        Text(emoji)
                            .font(Font.system(size: defaultEmojiSize))
                    }
                }
               
            }
            .padding(.horizontal)
            Rectangle().foregroundColor(.yellow)
                .edgesIgnoringSafeArea([.horizontal, .bottom])
        }
       
        
    }
    private let defaultEmojiSize: CGFloat = 40
}















