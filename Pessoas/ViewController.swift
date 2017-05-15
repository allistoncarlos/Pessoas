//
//  ViewController.swift
//  Aula6
//
//  Created by Alliston Aleixo on 09/05/17.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var telephone: UITextField!
    @IBOutlet weak var email: UITextField!
    
    var pessoas: [Pessoa] = [Pessoa]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //labelTitle.text = "Olá, pessoas!";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        view.backgroundColor = UIColor.darkGray
    }

    @IBAction func savePerson(_ sender: Any) {
        let alert = UIAlertController(title: "Confirme", message: "Deseja salvar a pessoa?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler: cancelar))
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: confirmaSalvar))
        self.present(alert, animated: true, completion: nil)
    }
    
    func cancelar(action: UIAlertAction) {
        debugPrint("Clicou no Cancelar");
    }
    
    func confirmaSalvar(action: UIAlertAction) {
        debugPrint("Clicou no OK");
        
        let pessoa = Pessoa(nome: name.text!, endereco: address.text!, telefone: telephone.text!, email: email.text!)
        debugPrint(pessoa);
        
        if (pessoa.Nome     != "" &&
            pessoa.Endereco != "" &&
            pessoa.Telefone != "" &&
            pessoa.Email    != "")
        {
            pessoas.append(pessoa);
            debugPrint(pessoas.count);
        }
        else {
            let alert = UIAlertController(title: "Atenção", message: "Todos os campos são obrigatórios. Tente novamente", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

