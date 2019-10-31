//
//  AlbumGenerator.swift
//  image-search
//
//  Created by Renato Vieira on 08/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation
import UIKit

func requestAlbum(url: String, view: ViewController) {
    if let fakeUrl = URL(string: "http://fakerapiexample.herokuapp.com/album") {
        URLSession.shared.dataTask(with: fakeUrl) { (data, response, error) in
            guard let data = data else {
                
                DispatchQueue.main.async {
                    Alert().display(view.self, "Attention", error?.localizedDescription ?? "Internet OffLine")
                }
                return
            }
    
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(SearchImages.self, from: data)
                view.updateAlbum(gitData: gitData)
            } catch {
                DispatchQueue.main.async {
                    Alert().display(view.self, "Attention", error.localizedDescription)
                }
              }
        }.resume()
    }
}




