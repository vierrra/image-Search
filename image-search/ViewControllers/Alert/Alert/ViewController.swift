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
        
        Alerta().exibir(self, "Atenção", "Api Indisponivel")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

