//
//  ViewController.swift
//  image-search
//
//  Created by Renato Vieira on 9/25/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit

struct Images: Codable{
    
    let id: String?
    let artistName: String?
    let recordLabel: String?
    let albumName: String?
    let algumCover: URL?
    
    private enum CodingKeys: String, CodingKey{
        
        case id
        case artisName
        case recordLabel
        case albumName
        case albumCover = "album_cover"
    }
}





class ViewController: UIViewController {

    
    let  activityIndicatorIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    @IBOutlet weak var imageBlur: UIImageView!
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelNameMusic: UILabel!
    @IBOutlet weak var labelNameArtist: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    func getNewAlbum() -> Album{
        let albumGeneretor = AlbumGenerator()
        let numberAlbum = Int.random(in: 0..<albumGeneretor.albumListing.count)
        let newAlbum: Album = albumGeneretor.albumListing[numberAlbum]
        
        return newAlbum
      
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 27
        
    }
    
    
        @IBAction func alterText(_ sender: Any) {
            
            activityIndicatorIndicator.center = self.view.center
            activityIndicatorIndicator.style = UIActivityIndicatorView.Style.white
            view.addSubview(activityIndicatorIndicator)
            
           
            let album = getNewAlbum()
            labelNameMusic.text = album.recordLabel
            labelNameArtist.text = album.artistName
            label.text = album.albumName
            
            
            activityIndicatorIndicator.startAnimating()
            
            image.image = UIImage(named: album.albumCover)
            imageBlur.image = UIImage(named: album.albumCover)
            
            activityIndicatorIndicator.stopAnimating()
            
            
            
            
        }
    
}
