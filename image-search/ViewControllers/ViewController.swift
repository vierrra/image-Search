//
//  ViewController.swift
//  image-search
//
//  Created by Renato Vieira on 9/25/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit

struct SearchImages: Codable{

    let id: String?
    let artistName: String?
    let recordLabel: String?
    let albumName: String?
    let albumCover: String?



     enum CodingKeys: String, CodingKey{

        case id
        case artistName   = "artist_name"
        case recordLabel = "record_label"
        case albumName   = "album_name"
        case albumCover  = "album_cover"
    }
}





class ViewController: UIViewController {
    
    let  activityIndicatorIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var imageBlur      : UIImageView!
    @IBOutlet weak var image          : UIImageView!
    @IBOutlet weak var labelNameAlbum : UILabel!
    @IBOutlet weak var labelNameMusic : UILabel!
    @IBOutlet weak var labelNameArtist: UILabel!
    @IBOutlet weak var button         : UIButton!
    
    
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
            
            //Request Json
            guard let fakeUrl = URL(string: "http://fakerapiexample.herokuapp.com/album") else { return }
            URLSession.shared.dataTask(with: fakeUrl) { (data, response
                     , error) in
                     guard let data = data else { return }
                     do {
                         let decoder = JSONDecoder()
                         let gitData = try decoder.decode(SearchImages.self, from: data)
                         DispatchQueue.main.sync {

                            if let gimage = gitData.albumCover {
                             let data = try? Data(contentsOf: gimage)
                             let image: UIImage = UIImage(data: data!)!
                             self.image.image = image
                         }
                        }

                     } catch let err {
                         print("Err", err)
                  }
            }.resume()
            
            
            
            
            activityIndicatorIndicator.startAnimating()
            
            activityIndicatorIndicator.center = self.view.center
            activityIndicatorIndicator.activityIndicatorViewStyle = UIActivityIndicatorView.Style.white
            view.addSubview(activityIndicatorIndicator)
            
            let album = getNewAlbum()
            labelNameMusic.text = album.recordLabel
            labelNameArtist.text = album.artistName
            labelNameAlbum.text = album.albumName
            image.image = UIImage(named: album.albumCover)
            imageBlur.image = UIImage(named: album.albumCover)
            
            activityIndicatorIndicator.stopAnimating()
            
            
            
            
        }
    
}
