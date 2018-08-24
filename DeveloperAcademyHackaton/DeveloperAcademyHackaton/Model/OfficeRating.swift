//
//  OfficeRating.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 24/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import Foundation

class OfficeRating {

    var quality: Double
    var waitingTime: Double
    var price: Double
    var cleaning: Double
    var coments: [String]

    init(_ quality: Double, _ waitingTime: Double, _ price: Double, _ cleaning: Double) {
        self.quality = quality
        self.waitingTime = waitingTime
        self.price = price
        self.cleaning = cleaning

        self.coments = []
    }
}
