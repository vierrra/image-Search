//
//  ViewController.swift
//  image-search
//
//  Created by Renato Vieira on 9/25/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let  activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var imageBlur        : UIImageView!
    @IBOutlet weak var image            : UIImageView!
    @IBOutlet weak var labelNameAlbum   : UILabel!
    @IBOutlet weak var labelNameMusic   : UILabel!
    @IBOutlet weak var labelNameArtist  : UILabel!
    @IBOutlet weak var buttonSearchAlbum: UIButton!
    
    func getNewAlbum() -> Album{
        
        let albumGeneretor  = AlbumGenerator()
        let numberAlbum     = Int.random(in: 0..<albumGeneretor.albumListing.count)
        let newAlbum: Album = albumGeneretor.albumListing[numberAlbum]
        
        return newAlbum
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonSearchAlbum.layer.cornerRadius = 27
    }
    
    @IBAction func alterText(_ sender: Any) {
            
        activityIndicator.center = self.view.center
        activityIndicator.style  = UIActivityIndicatorView.Style.white
        view.addSubview(activityIndicator)
            
        let album = getNewAlbum()
        
        activityIndicator.startAnimating()
        
        labelNameMusic.text  = album.recordLabel
        labelNameArtist.text = album.artistName
        labelNameAlbum.text  = album.albumName
            
        image.image     = UIImage(named: album.albumCover)
        imageBlur.image = UIImage(named: album.albumCover)
            
        activityIndicator.stopAnimating()
    }
}
