//
//  PessoasViewController.swift
//  Pessoas
//
//  Created by Alliston Aleixo on 30/06/17.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import UIKit
import Foundation

class PessoasViewController : UITableViewController {
    var operadoras: [String] = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let nib = UINib(nibName: "PessoaCell", bundle: nil);
        tableView.register(nib, forCellReuseIdentifier: "PessoaCell");
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        operadoras = AppDelegate.pessoas.group { $0.Operadora }.map { $0[0].Operadora }
        operadoras = operadoras.sorted { $0.localizedCaseInsensitiveCompare($1) == .orderedAscending }
        
        return operadoras.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let operadora = operadoras[section];
        
        let pessoas = AppDelegate.pessoas.filter { $0.Operadora == operadora };
        
        return pessoas.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PessoaCell") as! PessoaCell;
        
        let operadora = operadoras[indexPath.section];
        let pessoasOperadora = AppDelegate.pessoas.filter { $0.Operadora == operadora };
        let pessoa = pessoasOperadora[indexPath.row];
        
        cell.name.text = pessoa.Nome;
        cell.email.text = pessoa.Email;
        cell.operadora.text = pessoa.Operadora;
        cell.profileImage.image = pessoa.Imagem;
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return operadoras[section];
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95;
    }
}
