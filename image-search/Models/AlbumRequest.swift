//
//  File.swift
//  image-search
//
//  Created by Stant on 24/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation


guard let fakeUrl = URL(string: "http://fakerapiexample.herokuapp.com/album") else { return }

URLSession.shared.dataTask(with: fakeUrl) { (data, response, error) in
                                                
    guard let data = data else {
        
       DispatchQueue.main.async {
            Alert().display(self, "Attention", error?.localizedDescription ?? "Internet offline")
            self.activityIndicator.stopAnimating()
        }
        
    return}
   
         do {
             let decoder = JSONDecoder()
             let gitData = try decoder.decode(SearchImages.self, from: data)
            
                DispatchQueue.main.sync {
                                                    
                        if let url = URL(string: gitData.albumCover ?? "") {
                           let data = try? Data(contentsOf: url)
                           let image: UIImage     = UIImage(data: data!)!
                           let imageBlur: UIImage = UIImage(data: data!)!
                           self.imageBlur.image   = imageBlur
                           self.image.image       = image
                        }

                        if let anameAlbum             = gitData.albumName {
                            self.labelNameAlbum.text  = anameAlbum
                        }
                        
                        if let anameArtist            = gitData.artistName {
                            self.labelNameArtist.text = anameArtist
                        }
                        
                        if let anameAlbumCover        = gitData.recordLabel {
                            self.labelAlbumCover.text = anameAlbumCover
                        }
                        
                    self.activityIndicator.stopAnimating()
               }

        } catch {
             
            DispatchQueue.main.async {
                Alert().display(self, "Attention", error.localizedDescription)
                self.activityIndicator.stopAnimating()
            }
        }
}.resume()
