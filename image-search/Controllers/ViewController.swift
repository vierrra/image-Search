//
//  ViewController.swift
//  image-search
//
//  Created by Renato Vieira on 9/25/19.
//  Copyright © 2019 Stant. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    let loading = ActivityIndicator()
    
    @IBOutlet weak var imageBlur       : UIImageView!
    @IBOutlet weak var image           : UIImageView!
    @IBOutlet weak var labelNameAlbum  : UILabel!
    @IBOutlet weak var labelAlbumCover : UILabel!
    @IBOutlet weak var labelNameArtist : UILabel!
    @IBOutlet weak var button          : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 27
        self.getAlbum()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loading.view.frame = self.view.safeAreaLayoutGuide.layoutFrame
    }
    
    @IBAction func alterText(_ sender: Any) {
        self.getAlbum()
    }
    
    func getAlbum() {
        requestAlbum (view: self)
    }
    
    func showErrorAlert(_ controller: UIViewController, _ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(button)

        controller.present(alert, animated: true, completion: nil)
    }
         
    func updateAlbum(album: Album) {
        DispatchQueue.main.sync {
            view.addSubview(loading.view)
        }
        
        DispatchQueue.main.sync {
            if let url                = URL(string: album.albumCover ?? "") {
               let data               = try? Data(contentsOf: url)
               let image: UIImage     = UIImage(data: data!)!
               let imageBlur: UIImage = UIImage(data: data!)!
               self.imageBlur.image   = imageBlur
               self.image.image       = image
            }
                        
            if let albumName             = album.albumName {
               self.labelNameAlbum.text  = albumName
            }

            if let artistName             = album.artistName {
                self.labelNameArtist.text = artistName
            }

            if let recordName             = album.recordLabel {
                self.labelAlbumCover.text = recordName
            }
                self.loading.view.removeFromSuperview()
        }
    }
}
    

