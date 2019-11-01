//
//  Album.swift
//  image-search
//
//  Created by Renato Vieira on 08/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation

struct Album: Codable {

    let id         : String?
    let artistName : String?
    let recordLabel: String?
    let albumName  : String?
    let albumCover : String?

    enum CodingKeys: String, CodingKey {
        case id
        case artistName   = "artist_name"
        case recordLabel  = "record_label"
        case albumName    = "album_name"
        case albumCover   = "album_cover"    
    }
}
