//
//  ViewController.swift
//  image-search
//
//  Created by Renato on 9/25/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit


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
        
    }
    
    
        @IBAction func alterText(_ sender: Any) {
            
            let album = getNewAlbum()
            labelNameMusic.text = album.recordLabel
            labelNameArtist.text = album.artistName
            label.text = album.albumName
            
            
            
            image.image = UIImage(named: album.albumCover)
            
            
            
        }
    
}
