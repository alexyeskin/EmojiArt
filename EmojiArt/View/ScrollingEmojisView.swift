//
//  ScrollingEmojisView.swift
//  EmojiArt
//
//  Created by Aliaksandr Yeskin on 17.04.22.
//

import SwiftUI

struct ScrollingEmojisView: View {
    let emojis: String = "😀😃😄😁😆😅😂🤣🥲☺️😊😇🙂🙃😉😌😍🥰😘😗😙😚😋😛😝😜🤪🤨🧐🤓😎🤩🥳😏😒😞😔"
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(emojis.map { String($0) }, id: \.self) { emoji in
                    Text(emoji)
                        .font(.system(size: 40))
                        .onDrag { 
                            NSItemProvider(object: emoji as NSString)
                        }
                }
            }
        }
    }
}

struct PaletteView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingEmojisView()
            .previewLayout(.fixed(width: 500.0, height: 100.0))
            
    }
}
