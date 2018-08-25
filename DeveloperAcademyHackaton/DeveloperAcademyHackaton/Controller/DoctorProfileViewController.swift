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
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!

    @IBOutlet weak var firstStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePicture.layer.cornerRadius = profilePicture.frame.width / 2
        profilePicture.layer.masksToBounds = true

        guard let navController = self.navigationController else { return }

        let navBar = navController.navigationBar
        navBar.barTintColor = UIColor.customBlue
        navBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navBar.isTranslucent = false
    }

    @IBAction func returnWasPressed(_ sender: UIBarButtonItem) {
        guard let navController = self.navigationController else { return }
        navController.popViewController(animated: true)
    }
}

extension DoctorProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
