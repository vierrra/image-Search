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
    
    let urlApi  = "http://fakerapiexample.herokuapp.com/album"
    let loading = ActivytyIndicator()
    
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
      

//                guard let fakeUrl = URL(string: urlApi) else { return }
//
//                URLSession.shared.dataTask(with: fakeUrl) { (data, response, error) in
//
//                    guard let data = data else {
//
//                       DispatchQueue.main.async {
//                            Alert().display(self, "Attention", error?.localizedDescription ?? "Internet offline")

//                        }
//
//                        return
//
//                    }
//
//                         do {
//                             let decoder = JSONDecoder()
//                             let gitData = try decoder.decode(SearchImages.self, from: data)
//
//                                DispatchQueue.main.sync {
//
//                                        if let url = URL(string: gitData.albumCover ?? "") {
//                                           let data               = try? Data(contentsOf: url)
//                                           let image: UIImage     = UIImage(data: data!)!
//                                           let imageBlur: UIImage = UIImage(data: data!)!
//                                           self.imageBlur.image   = imageBlur
//                                           self.image.image       = image
//                                        }
//
//                                        if let anameAlbum             = gitData.albumName {
//                                            self.labelNameAlbum.text  = anameAlbum
//                                        }
//
//                                        if let anameArtist            = gitData.artistName {
//                                            self.labelNameArtist.text = anameArtist
//                                        }
//
//                                        if let anameAlbumCover        = gitData.recordLabel {
//                                            self.labelAlbumCover.text = anameAlbumCover
//                                        }
//
//                                    self.activityIndicator.stopAnimating()
//                               }
//
//                        } catch {
//
//                            DispatchQueue.main.async {
//                                Alert().display(self, "Attention", error.localizedDescription)
//                               self.activityIndicator.stopAnimating()
//                            }
//                        }
//                }.resume()
        
    }
    
    func getAlbum() {
        requestAlbum (url: urlApi, view: self)
    }
         
    func updateAlbum(gitData: SearchImages) {
        DispatchQueue.main.sync {
            view.addSubview(loading.view)
        }
        
        DispatchQueue.main.sync {
            if let url = URL(string: gitData.albumCover ?? "") {
               let data               = try? Data(contentsOf: url)
               let image: UIImage     = UIImage(data: data!)!
               let imageBlur: UIImage = UIImage(data: data!)!
               self.imageBlur.image   = imageBlur
               self.image.image       = image
            }
                    
            if let anameAlbum            = gitData.albumName {
               self.labelNameAlbum.text  = anameAlbum
                            }

            if let anameArtist            = gitData.artistName {
                self.labelNameArtist.text = anameArtist
            }

            if let anameAlbumCover        = gitData.recordLabel {
                self.labelAlbumCover.text = anameAlbumCover
            }
            self.loading.view.removeFromSuperview()
        }
    }
}
    

