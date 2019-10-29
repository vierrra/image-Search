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

func request(getURL: String, requestResponse: @escaping (Data?, Error?) -> Void) {
    guard let fakeUrl = URL(string: getURL) else { return }
    URLSession.shared.dataTask(with: fakeUrl) { (data, response, error) in
        guard data != nil else {return}
    
    }.resume()
                                        
}

func mountAlbum(url: String, view: ViewController) {
    request(getURL: url, requestResponse: { data, error in
        if let responseData = data {
            do {
                 let decoder = JSONDecoder()
                 let gitData = try decoder.decode(SearchImages.self, from: responseData)
                 view.updateAlbum(gitData: gitData)
                
            } catch {
            
            }
         }
     })
}




