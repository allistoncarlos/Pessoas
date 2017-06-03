//
//  TelaExtraViewController.swift
//  Pessoas
//
//  Created by Alliston Aleixo on 27/05/17.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import UIKit
import Foundation

class TelaExtraViewController : UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nascimento: UITextField!
    @IBOutlet weak var nascimentoPicker: UIDatePicker!
    @IBOutlet weak var sexo: UISegmentedControl!
    @IBOutlet weak var idade: UISlider!
    @IBOutlet weak var idadeLabel: UILabel!
    @IBOutlet weak var alturaStepper: UIStepper!
    @IBOutlet weak var alturaLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var progress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nascimentoPicker.isHidden = true;
        
        // Dismiss PickerView
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissPickerView))
        
        view.addGestureRecognizer(tap)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let isNascimentoField = textField == nascimento
        
        if (isNascimentoField)
        {
            nascimentoPicker.isHidden = !isNascimentoField;
            return !isNascimentoField;
        }
        
        return true;
    }
    
    // MARK: - DatePicker Events
    @IBAction func dateSelected(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        nascimento.text = dateFormatter.string(from: nascimentoPicker.date)
    }
    
    func dismissPickerView() {
        nascimentoPicker.isHidden = true;
    }
    
    @IBAction func save(_ sender: Any) {
//        var sexoText: String = "";
//        
//        switch sexo.selectedSegmentIndex {
//            case 0:
//                sexoText = "Masculino";
//            case 1:
//                sexoText = "Feminino";
//            default:
//                sexoText = "Outro";
//        }
//        
//        exibirMensagem(mensagem: sexoText);

        activityIndicator.startAnimating();
        progress.setProgress(0, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.progress.setProgress(1, animated: true)
            self.activityIndicator.stopAnimating();
        }
    }
    
    // MARK: - Slider Events
    @IBAction func idadeChanged(_ sender: Any) {
        idadeLabel.text = "\(Int(roundf(idade.value))) ano(s)";
    }
    
    // MARK: - Stepper Events
    @IBAction func alturaChanged(_ sender: Any) {
        alturaLabel.text = "\(alturaStepper.value) m"
    }
}
