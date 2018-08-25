//
//  DoctorOfficesTableViewCell.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 25/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import UIKit

class DoctorOfficesTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!

    @IBOutlet weak var firstStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!

    var picture: UIImage?
    var topText: String?
    var middleText: String?
    var rating: Double?

    override func layoutSubviews() {
        super.layoutSubviews()

        profilePicture.layer.cornerRadius = profilePicture.frame.width / 2
        profilePicture.layer.masksToBounds = true

        if let picture = picture {
            profilePicture.image = picture
        }

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
}
