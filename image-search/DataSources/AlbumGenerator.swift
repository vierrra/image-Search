//
//  AlbumGenerator.swift
//  image-search
//
//  Created by Renato Vieira on 08/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation
import UIKit

func requestAlbum(view: ViewController) {
    if let fakeUrl = URL(string: "http://fakerapiexample.herokuapp.com/album") {
        URLSession.shared.dataTask(with: fakeUrl) { (data, _ , error) in
            guard let data = data else {                
                DispatchQueue.main.async {
                    view.showErrorAlert(view.self, "Attention", error?.localizedDescription ?? "Internet OffLine")
                }
                return
            }
    
            do {
                let decoder = JSONDecoder()
                let decodeData = try decoder.decode(Album.self, from: data)
                view.updateAlbum(album: decodeData)
            } catch {
                DispatchQueue.main.async {
                    view.showErrorAlert(view.self, "Attention", error.localizedDescription)
                }
              }
        }.resume()
    }
}

