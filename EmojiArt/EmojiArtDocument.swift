//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by Aliaksandr Yeskin on 17.04.22.
//

import SwiftUI

typealias Location = (x: Int, y: Int)

class EmojiArtDocument: ObservableObject {
    @Published private(set) var emojiArt = EmojiArtModel()
    
    var emojis: [EmojiArtModel.Emoji] {
        emojiArt.emojis
    }
    
    var background: EmojiArtModel.Background {
        emojiArt.background
    }
    
    init() {
        asd()
    }
    
    func asd() {
        objectWillChange.sink { nothing in
            print("Something did change")
        }
        .cancel()
    }
    
    // MARK: Intents
    
    func setBackground(_ background: EmojiArtModel.Background) {
        emojiArt.background = background
    }
    
    func addEmoji(_ text: String, at location: Location, size: CGFloat) {
        emojiArt.addEmoji(text, at: location, size: Int(size))
    }
    
    func moveEmoji(_ emoji: EmojiArtModel.Emoji, by offset: CGSize) {
        if let index = emojiArt.emojis.index(matching: emoji) {
            var emoji = emojiArt.emojis[index]
            emoji.x += Int(offset.width)
            emoji.y += Int(offset.height)
        }
    }
    
    func scaleEmoji(_ emoji: EmojiArtModel.Emoji, by scale: CGFloat) {
        if let index = emojiArt.emojis.index(matching: emoji) {
            var emoji = emojiArt.emojis[index]
            emoji.size = Int((CGFloat(emoji.size) * scale).rounded())
        }
    }
}
