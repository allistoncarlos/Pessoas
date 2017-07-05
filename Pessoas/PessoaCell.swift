//
//  PessoaCell.swift
//  Pessoas
//
//  Created by Alliston Aleixo on 05/07/17.
//  Copyright © 2017 Alliston Aleixo. All rights reserved.
//

import UIKit
import Foundation

class PessoaCell: UITableViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var operadora: UILabel!
    
    override func awakeFromNib() {
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.clipsToBounds = true
    }
}
