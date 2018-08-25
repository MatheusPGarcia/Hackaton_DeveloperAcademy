//
//  OfficeMock.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 25/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import UIKit

class OfficeMock {

    var name: String
    var tel: String
    var rating: Double
    var image: UIImage

    init(_ name: String, _ tel: String, _ rating: Double, _ image: UIImage) {
        self.name = name
        self.tel = tel
        self.rating = rating
        self.image = image
    }
}
