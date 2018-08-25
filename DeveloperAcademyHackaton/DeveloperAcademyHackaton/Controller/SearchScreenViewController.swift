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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func indexChanged(_ sender: UISegmentedControl) {

        segmentedIndex = segmentedControll.selectedSegmentIndex

        let medicos = 0
        let consultorios = 1
        let favoritos = 2

        switch segmentedIndex {
        case medicos:
            print("Zero")
        case consultorios:
            print("One")
        case favoritos:
            print("Two")
        default:
            print("loco")
        }

        tableView.reloadData()
    }
}

extension SearchScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let identifier = "ModelCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ModelTableViewCell else { return UITableViewCell() }

        cell.topText = "Matheus Garcia"

        if segmentedIndex == 0 {
            cell.middleText = "Medico gato bagarai"
        } else if segmentedIndex == 1 {
            cell.middleText = "Consultorio gato bagarai"
        } else {
            cell.middleText = "Favorito gato bagarai"
        }

        let rating = Double(indexPath.row) + 0.2
        cell.rating = rating

        return cell
    }
}
