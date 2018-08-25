//
//  DoctorMock.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 25/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import UIKit

class DoctorMock {

    var name: String
    var specialist: String
    var rating: Double
    var image: UIImage

    init(_ name: String, _ specialist: String, _ rating: Double, _ image: UIImage) {
        self.name = name
        self.specialist = specialist
        self.rating = rating
        self.image = image
    }
}
