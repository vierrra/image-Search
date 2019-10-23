////
////  RequestApi.swift
////  image-search
////
////  Created by Stant on 23/10/19.
////  Copyright © 2019 Stant. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//func mapAlbum() {
//    guard let fakeUrl = URL(string: "http://fakerapiexample.herokuapp.com/album") else { return }
//
//            URLSession.shared.dataTask(with: fakeUrl) { (data, response, error) in
//
//                     guard let data = data else { return }
//                
//                     do {
//                         let decoder = JSONDecoder()
//                         let gitData = try decoder.decode(SearchImages.self, from: data)
//
////                        func RecoveryAlbum(){
//                            DispatchQueue.main.sync {
//                                //self.view.addSubview(self.loadActivityIndicator.view)
//                                //self.activityIndicator.startAnimating()
//                                    if let url = URL(string: gitData.albumCover ?? "") {
//                                       let data = try? Data(contentsOf: url)
//                                       let image: UIImage     = UIImage(data: data!)!
//                                       let imageBlur: UIImage = UIImage(data: data!)!
//                                       self.imageBlur.image   = imageBlur
//                                       self.image.image       = image
//                                       //self.loadActivityIndicator.view.removeFromSuperview()
//                                    }
//
////                                    if let anameAlbum            = gitData.albumName {
////                                        self.labelNameAlbum.text = anameAlbum
////                                    }
////
////                                    if let anameArtist            = gitData.artistName {
////                                        self.labelNameArtist.text = anameArtist
////                                    }
////
////                                    if let anameAlbumCover        = gitData.recordLabel {
////                                        self.labelAlbumCover.text = anameAlbumCover
////                                    }
//
//
//                                //self.activityIndicator.stopAnimating()
//                                }
////                        }
//
//                     } catch let error {
//                        //Alerta.exibir(self, "Atenção", error.localizedDescription)
//                        //print("ferrou!!!", error ?? "ferrou")
//                    }
//            }.resume()
//
//}
