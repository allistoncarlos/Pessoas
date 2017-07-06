//
//  Pessoa.swift
//  Pessoas
//
//  Created by Alliston Aleixo on 13/05/17.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import UIKit
import Foundation

class Pessoa {
    var Id:             Int;
    var Nome:           String;
    var Endereco:       String;
    var Imagem:         UIImage;
    var Telefone:       String;
    var Email:          String;
    var Operadora:      String;
    var Nascimento:     Date;
    var Sexo:           String;
    var Idade:          Int;
    var Altura:         Float;
    
    init() {
        Id          = Pessoa.getId();
        
        Nome        = "";
        Endereco    = "";
        Imagem      = UIImage();
        Telefone    = "";
        Email       = "";
        Operadora   = "";
        Nascimento  = Date();
        Sexo        = "";
        Idade       = 0;
        Altura      = 0;
    }
    
    init(nome: String,
         endereco: String,
         telefone: String,
         email: String,
         operadora: String,
         imagem: UIImage,
         nascimento: Date,
         sexo: String,
         idade: Int,
         altura: Float) {
        Id          = Pessoa.getId();
        
        Nome        = nome;
        Endereco    = endereco;
        Imagem      = imagem;
        Telefone    = telefone;
        Email       = email
        Operadora   = operadora;
        Nascimento  = nascimento;
        Sexo        = sexo;
        Idade       = idade;
        Altura      = altura;
    }
    
    private static func getId() -> Int {
        let totalPessoas = AppDelegate.pessoas.count;
        
        if (totalPessoas == 0) {
            return 1;
        }
        
        return AppDelegate.pessoas.map { $0.Id }.max()! + 1;
    }
}
