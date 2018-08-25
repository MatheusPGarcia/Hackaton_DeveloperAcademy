//
//  SearchScreenViewController.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 24/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import UIKit

class SearchScreenViewController: UIViewController {

    @IBOutlet weak var segmentedControll: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var segmentedIndex: Int = 0

    var doctorMock = [DoctorMock]()
    var officeMock = [OfficeMock]()
    var favoriteMock = [DoctorMock]()

    override func viewDidLoad() {
        super.viewDidLoad()

        instanciateMocks()

        guard let navController = self.navigationController else { return }

        let navBar = navController.navigationBar
        navBar.barTintColor = UIColor.customBlue
        navBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navBar.isTranslucent = false

        self.navigationItem.title = "Médicos"
    }

    func instanciateMocks() {
        let newDoc1 = DoctorMock("Giovana Lima", "Otorrinolaringologista", 4.5, UIImage(named: "m1")!)
        let newDoc2 = DoctorMock("Pedro Henrique", "Psiquiatra", 2.1, UIImage(named: "h1")!)
        let newDoc3 = DoctorMock("Julio Dalshtorm", "Pediatra", 4.6, UIImage(named: "h2")!)
        let newDoc4 = DoctorMock("Larissa Bueno", "Oftalmologista", 4.5, UIImage(named: "m2")!)
        let newDoc5 = DoctorMock("Bruna Lira", "Geriatria", 3.6, UIImage(named: "m3")!)

        self.doctorMock = [newDoc1, newDoc2, newDoc3, newDoc4, newDoc5]
        self.favoriteMock = [newDoc4]

        let newOffice1 = OfficeMock("Clinica Paula Rangel", "Tel: (19) 3224-7865", 2.1, UIImage(named: "of1")!)
        let newOffice2 = OfficeMock("Vitória Clinica Médica", "Tel: (19) 3345-7890", 3.5, UIImage(named: "of2")!)
        let newOffice3 = OfficeMock("Benavitta Prevenção e Saúde", "Tel: (19) 3227-1246", 4.6, UIImage(named: "of3")!)
        let newOffice4 = OfficeMock("Clinica Vila Itapura", "Tel: (19) 3239-2099", 5, UIImage(named: "of4")!)
        let newOffice5 = OfficeMock("Climed Clinica Médica", "Tel: (19) 3897-5957", 4.2, UIImage(named: "of5")!)

        self.officeMock = [newOffice1, newOffice2, newOffice3, newOffice4, newOffice5]
    }

    @IBAction func indexChanged(_ sender: UISegmentedControl) {

        segmentedIndex = segmentedControll.selectedSegmentIndex

        let medicos = 0
        let consultorios = 1
        let favoritos = 2

        switch segmentedIndex {
        case medicos:
            self.navigationItem.title = "Médicos"
        case consultorios:
            self.navigationItem.title = "Consultório"
        case favoritos:
            self.navigationItem.title = "Favoritos"
        default:
            print("Unexpected value")
        }

        tableView.reloadData()
    }
}

extension SearchScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedIndex == 0 {
            return doctorMock.count
        } else if segmentedIndex == 1 {
            return officeMock.count
        } else if segmentedIndex == 2 {
            return favoriteMock.count
        }

        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let identifier = "ModelCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ModelTableViewCell else { return UITableViewCell() }

        if segmentedIndex == 0 {
            let doctor = doctorMock[indexPath.row]

            cell.topText = doctor.name
            cell.middleText = doctor.specialist
            cell.rating = doctor.rating
            cell.picture = doctor.image

            return cell
        } else if segmentedIndex == 1 {
            let office = officeMock[indexPath.row]

            cell.topText = office.name
            cell.middleText = office.tel
            cell.rating = office.rating
            cell.picture = office.image

            return cell
        } else if segmentedIndex == 2 {
            let doctor = favoriteMock[indexPath.row]

            cell.topText = doctor.name
            cell.middleText = doctor.specialist
            cell.rating = doctor.rating
            cell.picture = doctor.image

            return cell
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let index = indexPath.row

        let mainView = UIStoryboard(name: "Main", bundle: nil)

        if segmentedIndex == 1 {

            let reference = "OfficeViewController"
            guard let destination = mainView.instantiateViewController(withIdentifier: reference) as? OfficeViewController else {
                return
            }

            self.navigationController?.pushViewController(destination, animated: true)
            return
        }

        var doctor: DoctorMock

        if segmentedIndex == 0 {
            doctor = doctorMock[index]
        } else {
            doctor = favoriteMock[index]
        }

        let reference = "DoctorProfileViewController"
        guard let destination = mainView.instantiateViewController(withIdentifier: reference) as? DoctorProfileViewController else {
            return
        }

        var offices = [OfficeMock]()
        offices.append(officeMock[1])
        offices.append(officeMock[2])

        destination.doctor = doctor
        destination.offices = offices

        self.navigationController?.pushViewController(destination, animated: true)
    }
}
