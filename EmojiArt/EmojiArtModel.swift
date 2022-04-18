//
//  EmojiArtModel.swift
//  EmojiArt
//
//  Created by Aliaksandr Yeskin on 17.04.22.
//

import Foundation

struct EmojiArtModel {
    struct Emoji: Identifiable, Hashable {
        let text: String
        var x: Int
        var y: Int
        var size: Int
        
        var id: Int {
            UUID().hashValue
        }
    }
    
    var background = Background.blank
    var emojis = [Emoji]()
    
    mutating func addEmoji(_ text: String, at location: (x: Int, y: Int), size: Int) {
        emojis.append(Emoji(text: text, x: location.x, y: location.y, size: size))
    }
}
