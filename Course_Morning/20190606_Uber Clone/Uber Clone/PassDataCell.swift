//
//  PassDataCell.swift
//  Uber Clone
//
//  Created by student on 2019/6/13.
//  Copyright © 2019年 Teacher. All rights reserved.
//

import UIKit

class PassDataCell: UITableViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var passEmail: UILabel!
    @IBOutlet weak var passLocation: UILabel!
    
    func configureCell(profileImage: String, passEmail: String, passLocation: String) {
        self.passEmail.text = passEmail
        self.passLocation.text = passLocation
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
