//
//  UIViewControllerExtensions.swift
//  Pessoas
//
//  Created by Alliston Aleixo on 20/05/17.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import UIKit
import Foundation

extension UIViewController {
    func exibirMensagem(mensagem: String, titulo: String = "Atenção")
    {
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func confirmar(mensagem: String, titulo: String = "Confirmação", confirmado: ((UIAlertAction) -> Swift.Void)? = nil, cancelado: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alertController = UIAlertController(title: "Confirmação", message: mensagem, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: confirmado))
        alertController.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.default, handler: cancelado))
        self.present(alertController, animated: true, completion: nil)
    }
}
