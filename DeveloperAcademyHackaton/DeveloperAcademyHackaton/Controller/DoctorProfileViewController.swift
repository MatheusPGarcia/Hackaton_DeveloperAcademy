//
//  DoctorProfileViewController.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 25/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import UIKit

class DoctorProfileViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var CRMCodeLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!

    @IBOutlet weak var firstStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!

    var doctor: DoctorMock!
    var offices: [OfficeMock]!

    override func viewDidLoad() {
        super.viewDidLoad()

        profilePicture.layer.cornerRadius = profilePicture.frame.width / 2
        profilePicture.layer.masksToBounds = true

        profilePicture.image = doctor.image

        guard let navController = self.navigationController else { return }

        let navBar = navController.navigationBar
        navBar.barTintColor = UIColor.customBlue
        navBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navBar.isTranslucent = false

        nameLabel.text = doctor.name
        CRMCodeLabel.text = "CRM: 118447"
        telLabel.text = "(19) 98219-8881"

        setRating()
    }

    func setRating() {
        let rating = doctor.rating
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

    @IBAction func returnWasPressed(_ sender: UIBarButtonItem) {
        guard let navController = self.navigationController else { return }
        navController.popViewController(animated: true)
    }
}

extension DoctorProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let titles = 2
        let specialist = 1
        let officesCount = offices.count

        let total = titles + specialist + officesCount

        return total
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let index = indexPath.row

        if index == 0 || index == 2 {

            let identifier = "DoctorTitleTableViewCell"

            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DoctorTitleTableViewCell else { return UITableViewCell() }

            if index == 0 {
                cell.title = "Especialidades"
            } else {
                cell.title = "Consultório"
            }

            return cell
        } else if index == 1 {

            let identifier = "DoctorSpecialistTableViewCell"

            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DoctorSpecialistTableViewCell else { return UITableViewCell() }

            cell.specialist = doctor.specialist

            return cell
        } else if index == 3 || index == 4 {

            let identifier = "DoctorOfficesTableViewCell"

            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DoctorOfficesTableViewCell else { return UITableViewCell() }

            let office = offices[index-3]

            cell.picture = office.image
            cell.topText = office.name
            cell.middleText = office.tel
            cell.rating = office.rating

            return cell
        }

        return UITableViewCell()
    }
}
