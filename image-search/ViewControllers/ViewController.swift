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
    
    let  loadActivityIndicator = ActivityIndicator()
    let gradient: CAGradientLayer = CAGradientLayer()
    
    @IBOutlet weak var imageBlur       : UIImageView!
    @IBOutlet weak var image           : UIImageView!
    @IBOutlet weak var labelNameAlbum  : UILabel!
    @IBOutlet weak var labelAlbumCover : UILabel!
    @IBOutlet weak var labelNameArtist : UILabel!
    @IBOutlet weak var button          : UIButton!
    
    
//    func getNewAlbum() -> Album{
//        let albumGeneretor = AlbumGenerator()
//        let numberAlbum = Int.random(in: 0..<albumGeneretor.albumListing.count)
//        let newAlbum: Album = albumGeneretor.albumListing[numberAlbum]
//
//        return newAlbum
    
//
//    }
    
override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 27
        self.view.layer.insertSublayer(gradient, at: 0)
        
}
    
    override func viewDidAppear(_ animated: Bool) {
        gradient.frame         = self.view.safeAreaLayoutGuide.layoutFrame
        loadActivityIndicator.view.frame = self.view.safeAreaLayoutGuide.layoutFrame
    }
    
    
    
    @IBAction func alterText(_ sender: Any) {
        
//            activityIndicator.center                     = self.view.center
//            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorView.Style.white
//            view.addSubview(activityIndicator)
            
            //Request API
            guard let fakeUrl = URL(string: "http://fakerapiexample.herokuapp.com/album") else { return }
            
            URLSession.shared.dataTask(with: fakeUrl) { (data, response, error) in
                
                     guard let data = data else { return }
                
                     do {
                         let decoder = JSONDecoder()
                         let gitData = try decoder.decode(SearchImages.self, from: data)
                        
//                        func RecoveryAlbum(){
                            DispatchQueue.main.sync {
                                self.view.addSubview(self.loadActivityIndicator.view)
                                //self.activityIndicator.startAnimating()
                                    if let url = URL(string: gitData.albumCover ?? "") {
                                       let data = try? Data(contentsOf: url)
                                       let image: UIImage     = UIImage(data: data!)!
                                       let imageBlur: UIImage = UIImage(data: data!)!
                                       self.imageBlur.image   = imageBlur
                                       self.image.image       = image
                                       self.loadActivityIndicator.view.removeFromSuperview()
                                    }

                                    if let anameAlbum            = gitData.albumName {
                                        self.labelNameAlbum.text = anameAlbum
                                    }
                                    
                                    if let anameArtist            = gitData.artistName {
                                        self.labelNameArtist.text = anameArtist
                                    }
                                    
                                    if let anameAlbumCover        = gitData.recordLabel {
                                        self.labelAlbumCover.text = anameAlbumCover
                                    }
                                    
                                
                                //self.activityIndicator.stopAnimating()
                                }
//                        }

                    } catch {
                        //Alerta.exibir(self, "Atenção", error.localizedDescription)
                        //print("ferrou!!!", error)
                    }
            }.resume()
            
           
    
        }
    
}
