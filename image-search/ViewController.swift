//
//  ViewController.swift
//  image-search
//
//  Created by Renato on 9/25/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit



class Album {

    var id: Int
    var artistName: String
    var recordLabel: String
    var albumName: String
    var albumCover: String

    init(id:Int, artistName: String, recordLabel: String, albumName: String, albumCover: String){
        self.id = id
        self.artistName = artistName
        self.recordLabel = recordLabel
        self.albumName = albumName
        self.albumCover = albumCover
    }
}


struct AlbumGenerator {
    var album1 = Album(id: 1, artistName: "Nirvana", recordLabel: "Smells Like Teen Spirit", albumName: "Nevermind", albumCover: "nirvana.jpg")
    var album2 = Album(id: 2, artistName: "PearlJam", recordLabel: "Black", albumName: "Alive", albumCover: "pearl.jpg")
    
    var albumListing: [Album]
    
    init(){
        albumListing = [album1, album2]
    }
    
}

func getNewAlbum() -> Album{
    let albumGeneretor = AlbumGenerator()
    let numberAlbum = Int.random(in: 0..<albumGeneretor.albumListing.count)
    let newAlbum: Album = albumGeneretor.albumListing[numberAlbum]
    
    return newAlbum
  
    
}


class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelNameMusic: UILabel!
    @IBOutlet weak var labelNameArtist: UILabel!
    @IBOutlet weak var button: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 27
        //label.text = "Nirvana"
    }
    
    
        @IBAction func alterText(_ sender: Any) {
            
        //label.text = "Nirvana"
            
           let album = getNewAlbum()
            labelNameMusic.text = album.recordLabel
            labelNameArtist.text = album.artistName
            label.text = album.albumName
            
            
            image.image = UIImage(named: album.albumCover)
            
            
            
        }
    
}
