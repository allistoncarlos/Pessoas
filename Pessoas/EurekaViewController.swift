//
//  EurekaViewController.swift
//  Pessoas
//
//  Created by Alliston Aleixo on 08/06/17.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import ImageRow
import Eureka
import Foundation

class EurekaViewController: FormViewController {
    let nameRow             = TextRow();
    let addressRow          = TextRow();
    let profileRow          = ImageRow();
    let phoneRow            = PhoneRow();
    let operadoraRow        = PickerInputRow<String>();
    let emailRow            = EmailRow();
    let birthdayRow         = DateRow();
    let sexRow              = SegmentedRow<String>();
    let ageRow              = SliderRow();
    let heightRow           = SliderRow();
    let buttonRow           = ButtonRow();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dados pessoais
        let personalData = Section("Dados pessoais");
        addName(section: personalData);
        addAddress(section: personalData);
        addProfile(section: personalData);
        form.append(personalData);
        
        // Contato
        let contactData = Section("Contato");
        addPhone(section: contactData);
        addOperadora(section: contactData);
        addEmail(section: contactData);
        
        form.append(contactData);
        
        // Demais Informações
        let otherSection = Section("Demais Informações");
        addBirthDate(section: otherSection);
        addSexo(section: otherSection);
        addAge(section: otherSection);
        addHeight(section: otherSection);
        
        form.append(otherSection);

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
        nameRow.placeholder = "Digite seu nome";
        nameRow.add(rule: RuleRequired(msg: "Campo Nome obrigatório"));
        
        section.append(nameRow);
    }
    
    func addAddress(section: Section) {
        addressRow.title = "Endereço";
        addressRow.placeholder = "Digite seu endereço";
        addressRow.add(rule: RuleRequired(msg: "Campo Endereço obrigatório"));
        
        section.append(addressRow);
    }
    
    func addProfile(section: Section) {
        profileRow.title = "Imagem de Perfil";
        profileRow.sourceTypes = .All;
        profileRow.cellUpdate(imageSelected)
        
        section.append(profileRow);
    }
    
    func addPhone(section: Section) {
        phoneRow.title = "Telefone";
        phoneRow.placeholder = "Digite seu telefone";
        
        let phoneRegex = RuleRegExp(regExpr: "^\\d{2} \\d{4}-\\d{4}$", allowsEmpty: false, msg: "Telefone deve estar no formato XX XXXX-XXXX")
        phoneRow.add(rule: phoneRegex);
        phoneRow.add(rule: RuleRequired(msg: "Campo Telefone obrigatório"));
        phoneRow.onRowValidationChanged(phoneRowValidate);
        phoneRow.cellUpdate(phoneRowValidate);
        
        section.append(phoneRow);
    }
    
    func addOperadora(section: Section) {
        operadoraRow.title = "Operadora";
        operadoraRow.options = [ "Claro", "Oi", "Vivo", "Tim" ];
        
        section.append(operadoraRow);
    }
    
    func addEmail(section: Section) {
        emailRow.title = "E-mail";
        emailRow.placeholder = "Digite seu e-mail";
        emailRow.add(rule: RuleEmail(msg: "Formato de e-mail inválido"));
        
        section.append(emailRow);
    }
    
    func addBirthDate(section: Section) {
        birthdayRow.title = "Data de nascimento";
        birthdayRow.value = Date(timeIntervalSinceReferenceDate: 0);
        birthdayRow.add(rule: RuleClosure<Date>(closure: dateRowClosure));
        birthdayRow.onRowValidationChanged(dateRowValidate);
        birthdayRow.cellUpdate(dateRowValidate);
        
        section.append(birthdayRow);
    }
    
    func addSexo(section: Section) {
        sexRow.title = "Sexo";
        sexRow.options = [ "Masculino", "Feminino", "Outros" ];
        
        section.append(sexRow);
    }
    
    func addAge(section: Section) {
        ageRow.title = "Idade";
        ageRow.minimumValue = 1;
        ageRow.maximumValue = 100;
        ageRow.steps = UInt(ageRow.maximumValue - ageRow.minimumValue);
        ageRow.value = 18;
        ageRow.displayValueFor = formatAge;
        
        section.append(ageRow);
    }
    
    func addHeight(section: Section) {
        //        let heightRow = StepperRow();
        //        heightRow.title = "Altura";
        //
        //        otherSection.append(heightRow);
        heightRow.title = "Altura";
        heightRow.minimumValue = 1.30;
        heightRow.maximumValue = 2.50;
        heightRow.steps = UInt((heightRow.maximumValue - heightRow.minimumValue) * 100);
        heightRow.value = 1.50;
        heightRow.displayValueFor = formatHeight;
        
        section.append(heightRow);
    }
    
    func formatAge(value: Float?) -> String? {
        if (value == nil) {
            return "0";
        }
        
        return String(Int(value!));
    }
    
    func formatHeight(value: Float?) -> String? {
        if (value == nil) {
            return "0";
        }
        
        return String.init(format: "%.2f", value!);
    }
    
    func imageSelected(cell: ImageCell, row: ImageRow) {
        cell.accessoryView?.layer.cornerRadius = 17
        cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
    }
    
    // Validações
    func phoneRowValidate(cell: PhoneCell, row: PhoneRow) {
        if !row.isValid {
            cell.titleLabel?.textColor = .red
            
            for error in row.validationErrors {
                debugPrint(error.msg);
            }
        }
    }
    
    func dateRowClosure(rowValue: Date?) -> ValidationError? {
        if (rowValue == nil) {
            return ValidationError(msg: "Data de nascimento obrigatória");
        }
        
        if (rowValue! > Date()) {
            return ValidationError(msg: "Data não pode ser maior que hoje");
        }
        
        let maxDateString = "01/01/2005";
        let formatter = DateFormatter();
        formatter.dateFormat = "dd/MM/yyyy";
        let maxDate = formatter.date(from: maxDateString);
        
        if (rowValue! > maxDate!) {
            return ValidationError(msg: "A data de nascimento deve ser inferior a \(maxDateString)");
        }
        
        return nil;
    }
    
    func dateRowValidate(cell: DateCell, row: DateRow) {
        if !row.isValid {
            cell.textLabel?.textColor = .red;
            
            for error in row.validationErrors {
                debugPrint(error.msg);
            }
        }
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
            let pessoa = Pessoa(nome: nameRow.value!, endereco: addressRow.value!, telefone: phoneRow.value!, email: emailRow.value!, operadora: operadoraRow.value!)
            
            AppDelegate.pessoas.append(pessoa);
            
            self.navigationController?.popViewController(animated: true);
        }
    }
}
