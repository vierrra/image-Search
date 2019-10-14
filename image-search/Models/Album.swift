//
//  Album.swift
//  image-search
//
//  Created by Renato Vieira on 08/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation

class Album {

    var id         : Int
    var artistName : String
    var recordLabel: String
    var albumName  : String
    var albumCover : String

    init(id:Int, artistName: String, recordLabel: String, albumName: String, albumCover: String){
        self.id          = id
        self.artistName  = artistName
        self.recordLabel = recordLabel
        self.albumName   = albumName
        self.albumCover  = albumCover
    }
    

}
