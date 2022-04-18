//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by Aliaksandr Yeskin on 16.04.22.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    
    var body: some View {
        VStack {
            DocumentBodyView(document: document)
            ScrollingEmojisView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentView(document: EmojiArtDocument())
            .previewInterfaceOrientation(.landscapeRight)
            .previewDevice("iPhone 13")
    }
}
