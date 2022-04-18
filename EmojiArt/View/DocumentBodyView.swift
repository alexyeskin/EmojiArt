//
//  DocumentBodyView.swift
//  EmojiArt
//
//  Created by Aliaksandr Yeskin on 17.04.22.
//

import SwiftUI

struct DocumentBodyView: View {
    let document: EmojiArtDocument
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.yellow
                ForEach(document.emojis) { emoji in
                    Text(emoji.text)
                        .font(.system(size: fontSize(for: emoji)))
                        .position(position(for: emoji, in: geometry))
                }
            }
            .onDrop(of: [.plainText], isTargeted: nil) { providers, location in
                drop(providers: providers, at: location, in: geometry)
            }
        }
    }
    
    private func drop(providers: [NSItemProvider], at location: CGPoint, in geometry: GeometryProxy) -> Bool {
        return providers.loadObjects(ofType: String.self) { string in
            if let emoji = string.first, emoji.isEmoji {
                document.addEmoji(
                    String(emoji),
                    at: convertToEmojiCoordinates(location, in: geometry),
                    size: 30
                )
            }
        }
    }
    
    private func fontSize(for emoji: EmojiArtModel.Emoji) -> CGFloat {
        CGFloat(emoji.size)
    }
    
    private func position(for emoji: EmojiArtModel.Emoji, in geometry: GeometryProxy) -> CGPoint {
        convertFromEmojiCoordinates(location: (emoji.x, emoji.y), in: geometry)
    }
    
    private func convertToEmojiCoordinates(
        _ location: CGPoint, 
        in geometry: GeometryProxy
    ) -> (x: Int, y: Int) {
        let center = geometry.frame(in: .local).center
        let location = CGPoint(
            x: location.x - center.x,
            y: location.y - center.y
        )
        
        return (Int(location.x), Int(location.y))
    }
    
    private func convertFromEmojiCoordinates(location: (x: Int, y: Int), in geometry: GeometryProxy) -> CGPoint {
        let center = geometry.frame(in: .local).center
        return CGPoint(
            x: center.x + CGFloat(location.x),
            y: center.y + CGFloat(location.y)
        )
    }
}

struct DocumentBodyView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentBodyView(document: EmojiArtDocument())
            .previewLayout(.fixed(width: 400.0, height: 300.0))
    }
}
