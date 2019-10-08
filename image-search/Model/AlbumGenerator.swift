//
//  AlbumGenerator.swift
//  image-search
//
//  Created by Stant on 08/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation

struct AlbumGenerator {
    var album1 = Album(id: 1, artistName: "Nirvana", recordLabel: "Smells Like Teen Spirit", albumName: "Nevermind", albumCover: "nirvana.jpg")
    var album2 = Album(id: 2, artistName: "PearlJam", recordLabel: "Black", albumName: "Alive", albumCover: "pearl.jpg")
    
    var albumListing: [Album]
    
    init(){
        albumListing = [album1, album2]
    }
    
}
