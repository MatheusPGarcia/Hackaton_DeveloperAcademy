//
//  InfoTableViewCell.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 25/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!

    var info: String?

    override func layoutSubviews() {
        if let info = info {
            infoLabel.text = info
        }
    }
}
