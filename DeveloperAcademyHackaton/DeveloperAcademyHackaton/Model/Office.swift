//
//  Office.swift
//  DeveloperAcademyHackaton
//
//  Created by Matheus Garcia on 24/08/18.
//  Copyright © 2018 Matheus Garcia. All rights reserved.
//

import Foundation

struct Office: Codable {

    var name: String
    var description: String
    var address: Address
    var officeRatings: [OfficeRating]
    // specialist
    // healthInsurance
    var doctors: [Doctor]
    // officeType

    init (_ name: String, _ description: String, _ address: Address, _ officeRatings: [OfficeRating]) {
        self.name = name
        self.description = description
        self.address = address
        self.officeRatings = officeRatings

        doctors = []
    }
}

extension Office {
    enum StructKeys: String, CodingKey {
        case name
        case description
        case address
        case officeRatings
        case doctors
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StructKeys.self)

        let name: String = try container.decode(String.self, forKey: .name)
        let description: String = try container.decode(String.self, forKey: .description)
        let address: Address = try container.decode(Address.self, forKey: .address)
        let officeRatings: [OfficeRating] = try container.decode([OfficeRating].self, forKey: .officeRatings)
        let doctors: [Doctor] = try container.decode([Doctor].self, forKey: .doctors)

        self.name = name
        self.description = description
        self.address = address
        self.officeRatings = officeRatings
        self.doctors = doctors
    }
}
