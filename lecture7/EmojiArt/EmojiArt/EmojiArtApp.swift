//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by mac on 2021/2/2.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: EmojiArtDocument())
        }
    }
}
