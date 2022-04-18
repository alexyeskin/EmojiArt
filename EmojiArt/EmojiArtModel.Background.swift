//
//  EmojiArtModel.Background.swift
//  EmojiArt
//
//  Created by Aliaksandr Yeskin on 17.04.22.
//

import Foundation

extension EmojiArtModel {
    enum Background {
        case blank
        case url(URL)
        case imageData(Data)
        
        var url: URL? {
            if case let .url(url) = self {
                return url
            } else {
                return nil
            }
        }
        
        var imageData: Data? {
            if case let .imageData(data) = self {
                return data
            } else {
                return nil
            }
        }
    }
}
