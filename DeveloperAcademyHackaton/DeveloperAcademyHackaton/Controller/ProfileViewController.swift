//
//  ProfileViewController.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 25/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var healInsuranceLabel: UILabel!
    @IBOutlet weak var insuranceNumberLabel: UILabel!

    var headers = [String]()
    var infos = [String]()
    var profile: ProfileMock?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let navController = self.navigationController else { return }

        let navBar = navController.navigationBar
        navBar.barTintColor = UIColor.customBlue
        navBar.isTranslucent = false

        pictureImage.layer.cornerRadius = pictureImage.frame.width / 2
        pictureImage.layer.masksToBounds = true

        generateMock()

        guard let profile = profile else { return }

        pictureImage.image = profile.picture
        nameLabel.text = profile.name
        healInsuranceLabel.text = profile.healthInsurance
        insuranceNumberLabel.text = profile.insuranceNumber
    }

    func generateMock() {
        let header1 = "Endereço"
        let header2 = "Telefone para contato"
        let header3 = "Data de Nascimento"
        let header4 = "Tipo Sanguínio"
        let header5 = "Peso"

        headers = [header1, header2, header3, header4, header5]

        let info1 = "Rua Roxo Moreira, 56, Campinas"
        let info2 = "(19) 98180 - 2672"
        let info3 = "12/09/1998"
        let info4 = "O-"
        let info5 = "100kg"

        infos = [info1, info2, info3, info4, info5]

        let pic = UIImage(named: "ValesUser")
        profile = ProfileMock("Paulo Henrique da Fonseca", "Saúde Beneficiência", "3899650484-0", pic!)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row

        if (index % 2) == 0 {
            let identifier = "TitleFieldTableViewCell"

            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TitleFieldTableViewCell else { return UITableViewCell() }

            let header = headers[index/2]

            cell.title = header

            return cell
        } else {
            let identifier = "InfoTableViewCell"

            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? InfoTableViewCell else { return UITableViewCell() }

            let info = infos[index/2]

            cell.info = info

            return cell
        }
    }
}
