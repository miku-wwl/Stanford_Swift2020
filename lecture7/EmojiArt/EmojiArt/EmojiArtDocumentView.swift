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
                .onDrop(of: ["public.image"], isTargeted: nil) {providers, location in
                    return self.drop(providers:providers)
                }
        }
       
        
    }
    private func drop(providers: [NSItemProvider])  ->Bool{
        let found = providers.loadFirstObject(ofType: URL.self)  {url in
            print("dropoed \(url)")
            self.document.setBackgroudUrl(url)
        }
        return found
    }
    
    private let defaultEmojiSize: CGFloat = 40
}















