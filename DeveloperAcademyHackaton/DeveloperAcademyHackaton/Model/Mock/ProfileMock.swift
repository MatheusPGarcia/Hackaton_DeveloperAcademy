//
//  ProfileMock.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 25/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import UIKit

class ProfileMock {

    var picture: UIImage
    var name: String
    var healthInsurance: String
    var insuranceNumber: String

    init(_ name: String, _ healthInsurance: String, _ insuranceNumber: String, _ picture: UIImage) {

        self.name = name
        self.healthInsurance = healthInsurance
        self.insuranceNumber = insuranceNumber
        self.picture = picture
    }
}
