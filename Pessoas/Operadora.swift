//
//  Operadora.swift
//  Pessoas
//
//  Created by Alliston Aleixo on 04/08/17.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import UIKit
import Foundation

class Operadora {
    var Id:             Int;
    var Nome:           String;
    
    init() {
        Id          = Operadora.getId();
        
        Nome        = "";
    }
    
    init(nome: String) {
        Id          = Operadora.getId();
        
        Nome        = nome;
    }
    
    private static func getId() -> Int {
        let totalOperadoras = AppDelegate.operadoras.count;
        
        if (totalOperadoras == 0) {
            return 1;
        }
        
        return AppDelegate.operadoras.map { $0.Id }.max()! + 1;
    }
}
