//
//  UserListTableViewCell.swift
//  Locus
//
//  Created by Marcelo Cristiano Araujo Silva on 06/05/2018.
//  Copyright © 2018 Locus. All rights reserved.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
