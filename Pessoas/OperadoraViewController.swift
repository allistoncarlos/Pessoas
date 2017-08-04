//
//  OperadoraViewController.swift
//  Pessoas
//
//  Created by Alliston Aleixo on 04/08/17.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import Eureka
import Foundation

class OperadoraViewController: FormViewController {
    let nameRow             = TextRow();
    let buttonRow           = ButtonRow();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let personalData = Section("Operadora");
        addName(section: personalData);
        form.append(personalData);
        
        // Botão
        let submitSection = Section("");
        
        buttonRow.title = "Salvar";
        buttonRow.value = "Salvando";
        buttonRow.onCellSelection(buttonClicked);
        
        submitSection.append(buttonRow);
        form.append(submitSection);
    }
    
    func addName(section: Section) {
        nameRow.title = "Nome";
        nameRow.placeholder = "Digite a operadora";
        nameRow.add(rule: RuleRequired(msg: "Campo Nome obrigatório"));
        
        section.append(nameRow);
    }
    
    // Salvar
    func buttonClicked(cell: ButtonCellOf<String>, row: ButtonRow) {
        let errosFormulario = form.validate();
        
        if (errosFormulario.count != 0) {
            var mensagem = "";
            
            for error in errosFormulario {
                mensagem += "\(error.msg)\n";
            }
            
            exibirMensagem(mensagem: mensagem);
        }
        else {
            let operadora = Operadora(
                nome:       nameRow.value!)
            
            AppDelegate.operadoras.append(operadora);
            
            self.navigationController?.popViewController(animated: true);
        }
    }
}
