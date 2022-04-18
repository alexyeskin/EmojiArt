//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Aliaksandr Yeskin on 16.04.22.
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
