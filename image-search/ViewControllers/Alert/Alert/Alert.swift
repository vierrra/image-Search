//
//  Alert.swift
//  Alert
//
//  Created by Stant on 24/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation
import UIKit


class Alerta: NSObject {

    func exibir(_ controller: UIViewController, _ titulo: String, _ mensagem: String) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let botao = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerta.addAction(botao)

        controller.present(alerta, animated: true, completion: nil)
    }

}
