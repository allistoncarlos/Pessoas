//
//  ViewController.swift
//  Pessoas
//
//  Created by Alliston Aleixo on 09/05/17.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UIPickerViewDataSource,
    UIPickerViewDelegate,
    UITextFieldDelegate {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var telephone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var operadora: UITextField!
    
    @IBOutlet weak var operadoraPicker: UIPickerView!
    var pessoas: [Pessoa] = [Pessoa]()
    var operadoras = ["Claro", "Oi", "Tim", "Vivo"]
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = "Olá, pessoas!";
        
        // Ocultar o PickerView ao entrar na tela
        operadoraPicker.isHidden = true;
        
        // Dismiss PickerView
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissPickerView))
        
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        view.backgroundColor = UIColor.darkGray
    }
    
    // MARK: - PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return operadoras.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return operadoras[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        operadora.text = operadoras[row]
    }
    
    func dismissPickerView() {
        operadoraPicker.isHidden = true;
    }

    // MARK: - Custom Methods
    @IBAction func savePerson(_ sender: Any) {
//        let alert = UIAlertController(title: "Confirme", message: "Deseja salvar a pessoa?", preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler: cancelar))
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: confirmaSalvar))
//        self.present(alert, animated: true, completion: nil)
        confirmar(mensagem: "Deseja salvar a pessoa?", confirmado: confirmaSalvar, cancelado: cancelar)
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
            
            exibirMensagem(mensagem: "Deu certo!", titulo: "Novo título");
        }
        else {
//            let alert = UIAlertController(title: "Atenção", message: "Todos os campos são obrigatórios. Tente novamente", preferredStyle: UIAlertControllerStyle.alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
            exibirMensagem(mensagem: "Todos os campos são obrigatórios")
        }
    }
    
    // MARK: - TextField Events
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let isOperadoraField = textField == operadora
        
        operadoraPicker.isHidden = !isOperadoraField;
        return !isOperadoraField;
    }
}

