//
//  DoctorSpecialistTableViewCell.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 25/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import UIKit

class DoctorSpecialistTableViewCell: UITableViewCell {

    @IBOutlet weak var specialistLabel: UILabel!
    
    var specialist: String?

    override func layoutSubviews() {
        if let specialist = specialist {
            specialistLabel.text = specialist
        }
    }
}
