//
//  ActivityIndicator.swift
//  image-search
//
//  Created by Renato Vieira on 22/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation
import UIKit

class ActivityIndicator: UIViewController {
    var activityIndicator = UIActivityIndicatorView()
        
    override func loadView() {
        view                    = UIView()
        view.backgroundColor    = UIColor(white: 0, alpha: 0.8)
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false        
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
