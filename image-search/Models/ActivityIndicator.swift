//
//  ActivityIndicator.swift
//  image-search
//
//  Created by Stant on 22/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation
import UIKit

class ActivytyIndicator: UIViewController {
    var activityIndicator = UIActivityIndicatorView()
    
    
    override func loadView() {
        view                 = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.8)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        

    }
}
