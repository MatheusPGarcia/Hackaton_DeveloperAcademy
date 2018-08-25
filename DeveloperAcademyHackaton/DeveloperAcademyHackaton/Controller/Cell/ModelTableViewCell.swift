//
//  DoctorTableViewCell.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 25/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import UIKit

class ModelTableViewCell: UITableViewCell {

    @IBOutlet weak var perfilPhoto: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!

    @IBOutlet weak var firstStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!

    var pictureUrl: String?
    var topText: String?
    var middleText: String?
    var rating: Double?

    override func layoutSubviews() {
        super.layoutSubviews()

        perfilPhoto.layer.cornerRadius = perfilPhoto.frame.width / 2
        perfilPhoto.layer.masksToBounds = true

        if let topText = topText {
            topLabel.text = topText
        }

        if let middleText = middleText {
            middleLabel.text = middleText
        }

        if let rating = rating {
            let stars = Int(rating)

            firstStar.image = UIImage(named: "full")
            if stars == 1 {
                return
            }
            secondStar.image = UIImage(named: "full")
            if stars == 2 {
                return
            }
            thirdStar.image = UIImage(named: "full")
            if stars == 3 {
                return
            }
            fourthStar.image = UIImage(named: "full")
            if stars == 4 {
                return
            }
            fifthStar.image = UIImage(named: "full")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
