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
    // MARK: - Outlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var telephone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var operadora: UITextField!
    
    @IBOutlet weak var operadoraPicker: UIPickerView!
    
    // MARK: - Private Fields
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
        confirmar(mensagem: "Deseja salvar a pessoa?", confirmado: confirmaSalvar, cancelado: cancelar)
    }
    
    func cancelar(action: UIAlertAction) {
        debugPrint("Clicou no Cancelar");
    }
    
    func confirmaSalvar(action: UIAlertAction) {
        debugPrint("Clicou no OK");
        
//        let pessoa = Pessoa(nome: name.text!, endereco: address.text!, telefone: telephone.text!, email: email.text!, operadora: operadora.text!)
//        debugPrint(pessoa);
//        
//        if (pessoa.Nome         != "" &&
//            pessoa.Endereco     != "" &&
//            pessoa.Telefone     != "" &&
//            pessoa.Email        != "" &&
//            pessoa.Operadora    != "")
//        {
//            pessoas.append(pessoa);
//            debugPrint(pessoas.count);
//            
//            exibirMensagem(mensagem: "Deu certo!", titulo: "Novo título");
//        }
//        else {
//            exibirMensagem(mensagem: "Todos os campos são obrigatórios")
//        }
    }
    
    // MARK: - TextField Events
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let isOperadoraField = textField == operadora
        
        if (isOperadoraField)
        {
            operadoraPicker.isHidden = !isOperadoraField;
            return !isOperadoraField;
        }
        
        return true;
    }
}

