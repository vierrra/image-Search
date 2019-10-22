//
//  Alert.swift
//  image-search
//
//  Created by Stant on 22/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation
import UIKit

class Alerta: NSObject {

    func exibir(_ controller: UIViewController, _ titulo: String, _ mensagem: String) {
        let alert  = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(button)

        controller.present(alert, animated: true, completion: nil)
    }

}
