//
//  TitleFieldTableViewCell.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 25/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import UIKit

class TitleFieldTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    var title: String?

    override func layoutSubviews() {
        if let title = title {
            titleLabel.text = title
        }
    }
}
