//
//  ViewController.swift
//  Alert
//
//  Created by Stant on 23/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func alertButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "My Title", message: "This is my message", preferredStyle: UIAlertController.Style.alert)
                 
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
      
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

