//
//  Pessoa.swift
//  Pessoas
//
//  Created by Alliston Aleixo on 13/05/17.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import Foundation

class Pessoa {
    var Nome:           String;
    var Endereco:       String;
    var Telefone:       String;
    var Email:          String;
    var Operadora:      String;
    
    init() {
        Nome        = "";
        Endereco    = "";
        Telefone    = "";
        Email       = "";
        Operadora   = "";
    }
    
    init(nome: String, endereco: String, telefone: String, email: String, operadora: String) {
        Nome        = nome;
        Endereco    = endereco;
        Telefone    = telefone;
        Email       = email
        Operadora   = operadora;
    }
}
