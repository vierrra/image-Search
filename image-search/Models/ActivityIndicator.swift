//
//  ActivityIndicator.swift
//  image-search
//
//  Created by Stant on 22/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation
import UIKit

//class ActivityIndicator: UIViewController {
//    var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
//
//    override func loadView() {
//        view                 = UIView()
//        view.backgroundColor = UIColor(white: 0, alpha: 2)
//
//        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
//        activityIndicator.startAnimating()
//        view.addSubview(activityIndicator)
//
//        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//    }
//}
//


class ActivityIndicator: UIViewController {
    var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)

    override func loadView() {
        view                 = UIView()
        activityIndicator.center                     = self.view.center
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorView.Style.white
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()

        
    }
}
//



