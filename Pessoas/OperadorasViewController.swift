//
//  OperadorasViewController.swift
//  Pessoas
//
//  Created by Alliston Aleixo on 04/08/17.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import UIKit
import Foundation

class OperadorasViewController : UITableViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.operadoras.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "OperadoraCell")!;
        
        let operadora = AppDelegate.operadoras[indexPath.row]
        
        cell.textLabel?.text = operadora.Nome;
        
        return cell;
    }
}
