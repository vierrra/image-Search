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
        view.addSubview(loading.view)
        requestAlbum (view: self)
    }
    
    func showErrorAlert(_ controller: UIViewController, _ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(button)
        self.loading.view.removeFromSuperview()
        controller.present(alert, animated: true, completion: nil)
    }
         
    func updateAlbum(album: Album) {
        DispatchQueue.main.sync {
            if let url                = URL(string: album.albumCover ?? "") {
               let data               = try? Data(contentsOf: url)
                if let data = data {
                    let image: UIImage     = UIImage(data: data) ?? UIImage()
                    let imageBlur: UIImage = UIImage(data: data) ?? UIImage()
                    self.imageBlur.image   = imageBlur
                    self.image.image       = image
                }
            }
            self.labelNameAlbum.text  = album.albumName
            self.labelNameArtist.text = album.artistName
            self.labelAlbumCover.text = album.recordLabel
            self.loading.view.removeFromSuperview()
        }
    }
}
    

