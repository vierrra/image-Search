//
//  AlbumGenerator.swift
//  image-search
//
//  Created by Renato Vieira on 08/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation
import UIKit

//struct AlbumGenerator {
//    var album1 = Album(id: 1, artistName: "Nirvana", recordLabel: "Smells Like Teen Spirit", albumName: "Nevermind", albumCover: "nirvana.jpg")
//    var album2 = Album(id: 2, artistName: "PearlJam", recordLabel: "Black", albumName: "Alive", albumCover: "pearl.jpg")
//    
//    var albumListing: [Album]
//    
//    init(){
//        albumListing = [album1, album2]
//    }
//}

func requestAlbum(url: String, view: ViewController) {
    if let fakeUrl = URL(string: "http://fakerapiexample.herokuapp.com/album") {
        URLSession.shared.dataTask(with: fakeUrl) { (data, response, error) in
            guard let data = data else {return}
    
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(SearchImages.self, from: data)
                view.updateAlbum(gitData: gitData)
            } catch {
              
              }
        }.resume()
    }
}




