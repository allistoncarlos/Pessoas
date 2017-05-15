//
//  Pessoa.swift
//  Aula6
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
    
    init() {
        Nome        = "";
        Endereco    = "";
        Telefone    = "";
        Email       = "";
    }
    
    init(nome: String, endereco: String, telefone: String, email: String) {
        Nome        = nome;
        Endereco    = endereco;
        Telefone    = telefone;
        Email       = email
    }
}
